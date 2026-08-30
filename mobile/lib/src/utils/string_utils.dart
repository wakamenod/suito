extension NullIfEmpty on String {
  /// `null` for the empty string, otherwise the string itself.
  ///
  /// The forms model "no category / no location / no income type" as an empty
  /// string, but the matching columns are nullable `uuid` -- Postgres rejects
  /// `''` as a uuid, so the empty case has to travel as SQL NULL.
  String? get orNull => isEmpty ? null : this;
}
