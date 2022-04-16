class role::mailserver {
  role { 'mailserver':
    description => 'Mail server',
  }

  ::include::mail
}
