@test 'Docker image test:' { :; }

@test '  verdaccio version' {
  verdaccio -V | grep "$VERDACCIO_VERSION"
}

@test '  sinopia-crowd is installed' {
  npm list -g | grep 'sinopia-crowd'
}
