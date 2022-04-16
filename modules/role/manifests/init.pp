# Displays a MOTD and other appropriate things for a role
define role (
  Optional[String] $description = undef,
) {
  $real_description = $description ? {
    undef   => "role::${title}",
    default => "${description} (role::${title})",
  }

  motd::script { "role-${title}":
    ensure   => present,
    priority => 5,
    content  => template('role/motd.sh.erb'),
  }
}

