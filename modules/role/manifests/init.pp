define role (
  Optional[String] $description = undef,
) {
  $real_description = $description ? {
    undef   => "role::${title}",
    default => "${description} (role::${title})",
  }
}
