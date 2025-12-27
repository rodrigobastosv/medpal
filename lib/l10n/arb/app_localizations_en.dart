// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get step1IntroTitle => 'Stay Connected with Your Patients';

  @override
  String get step1IntroDescription => 'MedPal helps you stay in touch with your patients anytime, anywhere — securely and effortlessly.';

  @override
  String get step2IntroTitle => 'Simplify Your Schedule';

  @override
  String get step2IntroDescription =>
      'View, confirm, and organize your daily consultations in one place — no more double bookings or missed sessions.';

  @override
  String get step3IntroTitle => 'Personalized Patient Care';

  @override
  String get step3IntroDescription => 'Access patient history, medications, and updates instantly to provide more personalized care.';

  @override
  String get step4IntroTitle => 'Your Data is Always Secure';

  @override
  String get step4IntroDescription => 'Your communications and patient data are encrypted and handled with the highest privacy standards.';

  @override
  String get skip => 'Skip';

  @override
  String get next => 'Next';

  @override
  String get done => 'Done';

  @override
  String get createYourAccount => 'Create your account';

  @override
  String get joinMedPal => 'Join MedPal and start managing your patients';

  @override
  String minimumCharacters(int qty) {
    return 'Minimum $qty characters';
  }

  @override
  String get alreadyHaveAnAccount => 'Already have an account?';

  @override
  String get signUp => 'Sign Up';

  @override
  String get createAccountOr => 'Create an account or';

  @override
  String get welcomeBack => 'Welcome back';

  @override
  String get signInDisclaimer => 'Sign in to access your patients and insights';

  @override
  String get forgotPassword => 'Forgot Password?';

  @override
  String get continueWord => 'Continue';

  @override
  String get dontHaveAccount => 'Don\'t have an account?';

  @override
  String get signIn => 'Sign in';

  @override
  String get name => 'Name';

  @override
  String get lastName => 'Last Name';

  @override
  String get email => 'E-mail';

  @override
  String get password => 'Password';

  @override
  String get confirmPassword => 'Confirm Password';

  @override
  String get invalidEmail => 'Invalid E-mail';

  @override
  String get passwordsDoNotMatch => 'Passwords do not match';

  @override
  String get error => 'Error';

  @override
  String get unknownError => 'Unknown Error';

  @override
  String get ok => 'Ok';

  @override
  String get emailAlreadyInUseError => 'This email is already in use. Please use a different one or sign in instead.';

  @override
  String get invalidEmailError => 'The email address you entered is not valid. Please check and try again.';

  @override
  String get weakPasswordError => 'Your password is too weak. Try using a mix of letters, numbers, and symbols.';

  @override
  String get unknownSignUpError => 'An unexpected error occurred during sign up. Please try again later.';

  @override
  String get invalidEmailSignInError => 'The email address you entered is not valid. Please check and try again.';

  @override
  String get userDisabledSignInError => 'This account has been disabled. Please contact support for more information.';

  @override
  String get userNotFoundSignInError => 'We couldn’t find an account with this email. Please check the address or sign up.';

  @override
  String get invalidCredentialsSignInError => 'The credentials you entered are invalid. Please check and try again.';

  @override
  String get wrongPasswordSignInError => 'The password you entered is incorrect. Please try again.';

  @override
  String get unknownSignInError => 'An unexpected error occurred during sign in. Please try again later.';

  @override
  String get addNewPatient => 'Add New Patient';

  @override
  String get registerPatientProfile => 'Register a new patient profile';

  @override
  String greetings(String timeOfDay, String name) {
    return 'Good $timeOfDay, $name';
  }

  @override
  String patientsNeedAtention(int numberOfPatientsNeedAttention) {
    return '$numberOfPatientsNeedAttention patients need attention today';
  }

  @override
  String get addProfilePicture => 'Add profile picture';

  @override
  String get optional => 'Optional';

  @override
  String get genderMale => 'Male';

  @override
  String get genderFemale => 'Female';

  @override
  String get genderOther => 'Other';

  @override
  String get basicInformation => 'Basic information';

  @override
  String get demographics => 'Demographics';

  @override
  String get notes => 'Notes';

  @override
  String get fullNameLabel => 'Full name';

  @override
  String get fullNameRequired => 'Name is required';

  @override
  String get birthDateLabel => 'Date of birth';

  @override
  String get birthDateHint => 'DD / MM / YYYY';

  @override
  String get genderLabel => 'Gender';

  @override
  String get notesHint => 'Additional information, allergies, observations...';

  @override
  String get savePatient => 'Save patient';

  @override
  String get phone => 'Phone';

  @override
  String get missingRequiredInformation => 'Missing required information';

  @override
  String get contactInformation => 'Contact Information';

  @override
  String get extraInformation => 'Extra Information';

  @override
  String get addPatient => 'Add Patient';

  @override
  String get searchPatients => 'Search Patients';

  @override
  String get allPatients => 'All Patients';

  @override
  String patientAgeGender(num age, Object gender) {
    String _temp0 = intl.Intl.pluralLogic(age, locale: localeName, other: '$age years', one: '$age year');
    return '$_temp0 • $gender';
  }

  @override
  String patientLastVisit(Object date) {
    return 'Last visit: $date';
  }
}
