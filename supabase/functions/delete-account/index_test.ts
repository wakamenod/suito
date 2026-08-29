// Integration tests for the `delete-account` Edge Function.
//
// Runs against the local Supabase stack:
//   npx supabase start
//   deno test --allow-net --allow-env supabase/functions/delete-account/index_test.ts
//
// Overridable via env: SUPABASE_URL, SUPABASE_ANON_KEY, SUPABASE_SERVICE_ROLE_KEY
// (defaults are the well-known local development keys).

import {
  assert,
  assertEquals,
} from "https://deno.land/std@0.224.0/assert/mod.ts";
import { createClient } from "jsr:@supabase/supabase-js@2";

const SUPABASE_URL = Deno.env.get("SUPABASE_URL") ?? "http://127.0.0.1:54321";
const ANON_KEY = Deno.env.get("SUPABASE_ANON_KEY") ??
  "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZS1kZW1vIiwicm9sZSI6ImFub24iLCJleHAiOjE5ODM4MTI5OTZ9.CRXP1A7WOeoJeXxjNni43kdQwgnWNReilDMblYTn_I0";
const SERVICE_ROLE_KEY = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY") ??
  "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZS1kZW1vIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImV4cCI6MTk4MzgxMjk5Nn0.EGIM96RAZx35lJzdJsyH-qQwv8Hdp7fsn3W0YpN81IU";

const FN_URL = `${SUPABASE_URL}/functions/v1/delete-account`;
const admin = createClient(SUPABASE_URL, SERVICE_ROLE_KEY, {
  auth: { persistSession: false, autoRefreshToken: false },
});

async function makeUser(): Promise<{ id: string; token: string }> {
  const email = `deltest_${crypto.randomUUID()}@test.dev`;
  const password = "password123!";
  const { data: created, error: cErr } = await admin.auth.admin.createUser({
    email,
    password,
    email_confirm: true,
  });
  if (cErr || !created.user) throw cErr ?? new Error("createUser failed");

  const anon = createClient(SUPABASE_URL, ANON_KEY, {
    auth: { persistSession: false, autoRefreshToken: false },
  });
  const { data: signed, error: sErr } = await anon.auth.signInWithPassword({
    email,
    password,
  });
  if (sErr || !signed.session) throw sErr ?? new Error("signIn failed");

  return { id: created.user.id, token: signed.session.access_token };
}

function callFn(init: RequestInit): Promise<Response> {
  return fetch(FN_URL, { method: "POST", ...init });
}

Deno.test("rejects a request with no Authorization header (401)", async () => {
  const res = await callFn({ headers: { apikey: ANON_KEY } });
  await res.body?.cancel();
  assertEquals(res.status, 401);
});

Deno.test("rejects a malformed bearer token (401)", async () => {
  const res = await callFn({
    headers: {
      apikey: ANON_KEY,
      Authorization: "Bearer not.a.real.jwt",
      "Content-Type": "application/json",
    },
    body: "{}",
  });
  await res.body?.cancel();
  assertEquals(res.status, 401);
});

Deno.test("rejects deleting another user's id (403)", async () => {
  const a = await makeUser();
  const b = await makeUser();

  const res = await callFn({
    headers: {
      apikey: ANON_KEY,
      Authorization: `Bearer ${a.token}`,
      "Content-Type": "application/json",
    },
    body: JSON.stringify({ user_id: b.id }),
  });
  const payload = await res.json();
  assertEquals(res.status, 403);
  assertEquals(payload.error, "Cannot delete another user");

  // both users still exist
  const { data: stillA } = await admin.auth.admin.getUserById(a.id);
  const { data: stillB } = await admin.auth.admin.getUserById(b.id);
  assert(stillA.user, "caller must not have been deleted");
  assert(stillB.user, "target must not have been deleted");

  await admin.auth.admin.deleteUser(a.id);
  await admin.auth.admin.deleteUser(b.id);
});

Deno.test("deletes the caller and cascades their domain rows (200)", async () => {
  const a = await makeUser();

  // seed domain data that must be cascade-deleted with the auth user
  const { error: catErr } = await admin.from("expense_category").insert({
    user_id: a.id,
    name: "to-be-cascaded",
  });
  assertEquals(catErr, null);
  const { error: expErr } = await admin.from("expense").insert({
    user_id: a.id,
    title: "to-be-cascaded",
    amount: 100,
    memo: "",
    local_date: "2026-01-01",
  });
  assertEquals(expErr, null);

  const res = await callFn({
    headers: {
      apikey: ANON_KEY,
      Authorization: `Bearer ${a.token}`,
      "Content-Type": "application/json",
    },
    body: "{}",
  });
  const payload = await res.json();
  assertEquals(res.status, 200);
  assertEquals(payload.success, true);
  assertEquals(payload.deleted, a.id);

  // auth user is gone
  const { data: gone } = await admin.auth.admin.getUserById(a.id);
  assertEquals(gone.user, null);

  // domain rows cascaded
  const cat = await admin
    .from("expense_category")
    .select("*", { count: "exact", head: true })
    .eq("user_id", a.id);
  assertEquals(cat.count, 0);
  const exp = await admin
    .from("expense")
    .select("*", { count: "exact", head: true })
    .eq("user_id", a.id);
  assertEquals(exp.count, 0);
});
