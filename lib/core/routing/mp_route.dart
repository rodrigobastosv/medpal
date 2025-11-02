enum MPRoute {
  bootstrap('/'),
  welcome('/welcome'),
  signIn('/sign-in'),
  signUp('/sign-up'),
  home('/home');

  const MPRoute(this.path);

  final String path;
}
