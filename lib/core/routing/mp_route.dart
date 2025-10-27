enum MPRoute {
  bootstrap('/'),
  welcome('/welcome'),
  signIn('/sign-in'),
  signUp('/sign-up');

  const MPRoute(this.path);

  final String path;
}
