// Edge Function: delete-account
//
// Self-service account deletion for the `web/` account-deletion app (Google Play
// policy) and, later, the mobile app. The caller's JWT is verified and only the
// caller's own user id is ever deleted. Every domain table FKs `auth.users` with
// ON DELETE CASCADE, so deleting the auth user wipes all of their data too.
//
// Deliberately NOT a SECURITY DEFINER RPC against auth.users (search_path /
// privilege-leak risk, and direct DELETE on auth.users is unsupported).

import { createClient } from "jsr:@supabase/supabase-js@2";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Headers":
    "authorization, x-client-info, apikey, content-type",
  "Access-Control-Allow-Methods": "POST, OPTIONS",
};

function json(body: unknown, status = 200): Response {
  return new Response(JSON.stringify(body), {
    status,
    headers: { ...corsHeaders, "Content-Type": "application/json" },
  });
}

Deno.serve(async (req) => {
  if (req.method === "OPTIONS") {
    return new Response("ok", { headers: corsHeaders });
  }
  if (req.method !== "POST") {
    return json({ error: "Method not allowed" }, 405);
  }

  const authHeader = req.headers.get("Authorization");
  if (!authHeader) {
    return json({ error: "Missing Authorization header" }, 401);
  }

  const SUPABASE_URL = Deno.env.get("SUPABASE_URL");
  const SUPABASE_ANON_KEY = Deno.env.get("SUPABASE_ANON_KEY");
  const SERVICE_ROLE_KEY = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
  if (!SUPABASE_URL || !SUPABASE_ANON_KEY || !SERVICE_ROLE_KEY) {
    return json({ error: "Function is misconfigured" }, 500);
  }

  // 1. Verify the caller from their JWT.
  const callerClient = createClient(SUPABASE_URL, SUPABASE_ANON_KEY, {
    global: { headers: { Authorization: authHeader } },
    auth: { persistSession: false, autoRefreshToken: false },
  });
  const { data: { user }, error: userErr } = await callerClient.auth.getUser();
  if (userErr || !user) {
    return json({ error: "Invalid or expired token" }, 401);
  }

  // 2. If the request body names a user_id, it must be the caller's own.
  let targetId = user.id;
  try {
    const raw = await req.text();
    if (raw.trim().length > 0) {
      const body = JSON.parse(raw);
      if (body?.user_id && body.user_id !== user.id) {
        return json({ error: "Cannot delete another user" }, 403);
      }
      if (body?.user_id) targetId = body.user_id;
    }
  } catch {
    return json({ error: "Invalid JSON body" }, 400);
  }

  // 3. Delete as admin. Cascades through every domain table.
  const adminClient = createClient(SUPABASE_URL, SERVICE_ROLE_KEY, {
    auth: { persistSession: false, autoRefreshToken: false },
  });
  const { error: delErr } = await adminClient.auth.admin.deleteUser(targetId);
  if (delErr) {
    return json({ error: delErr.message }, 500);
  }

  return json({ success: true, deleted: targetId });
});
