enum MPRoute {
  bootstrap('/'),
  welcome('/welcome'),
  signIn('/sign-in'),
  signUp('/sign-up'),
  home('/home'),
  registerPatient('/register-patient'),
  searchPatients('/search-patients'),
  profile('/profile');

  const MPRoute(this.path);

  final String path;
}
