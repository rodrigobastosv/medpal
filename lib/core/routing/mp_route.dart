enum MPRoute {
  bootstrap('/'),
  welcome('/welcome'),
  signIn('/sign-in'),
  signUp('/sign-up'),
  home('/home'),
  registerPatient('/register-patient'),
  listPatients('/patients'),
  profile('/profile'),
  createAppointment('/create-appointment'),
  calendar('/calendar');

  const MPRoute(this.path);

  final String path;
}
