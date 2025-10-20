enum MPRoute {
  bootstrap('/'),
  welcome('/welcome'),
  signIn('/sign-in');

  const MPRoute(this.path);

  final String path;
}
