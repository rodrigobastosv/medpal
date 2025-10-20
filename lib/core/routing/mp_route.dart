enum MPRoute {
  bootstrap('/'),
  signIn('/sign-in');

  const MPRoute(this.path);

  final String path;
}
