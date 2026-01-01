import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_pt.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'arb/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('en'), Locale('pt')];

  /// No description provided for @step1IntroTitle.
  ///
  /// In en, this message translates to:
  /// **'Stay Connected with Your Patients'**
  String get step1IntroTitle;

  /// No description provided for @step1IntroDescription.
  ///
  /// In en, this message translates to:
  /// **'MedPal helps you stay in touch with your patients anytime, anywhere — securely and effortlessly.'**
  String get step1IntroDescription;

  /// No description provided for @step2IntroTitle.
  ///
  /// In en, this message translates to:
  /// **'Simplify Your Schedule'**
  String get step2IntroTitle;

  /// No description provided for @step2IntroDescription.
  ///
  /// In en, this message translates to:
  /// **'View, confirm, and organize your daily consultations in one place — no more double bookings or missed sessions.'**
  String get step2IntroDescription;

  /// No description provided for @step3IntroTitle.
  ///
  /// In en, this message translates to:
  /// **'Personalized Patient Care'**
  String get step3IntroTitle;

  /// No description provided for @step3IntroDescription.
  ///
  /// In en, this message translates to:
  /// **'Access patient history, medications, and updates instantly to provide more personalized care.'**
  String get step3IntroDescription;

  /// No description provided for @step4IntroTitle.
  ///
  /// In en, this message translates to:
  /// **'Your Data is Always Secure'**
  String get step4IntroTitle;

  /// No description provided for @step4IntroDescription.
  ///
  /// In en, this message translates to:
  /// **'Your communications and patient data are encrypted and handled with the highest privacy standards.'**
  String get step4IntroDescription;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @done.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// No description provided for @createYourAccount.
  ///
  /// In en, this message translates to:
  /// **'Create your account'**
  String get createYourAccount;

  /// No description provided for @joinMedPal.
  ///
  /// In en, this message translates to:
  /// **'Join MedPal and start managing your patients'**
  String get joinMedPal;

  /// No description provided for @minimumCharacters.
  ///
  /// In en, this message translates to:
  /// **'Minimum {qty} characters'**
  String minimumCharacters(int qty);

  /// No description provided for @alreadyHaveAnAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get alreadyHaveAnAccount;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signUp;

  /// No description provided for @createAccountOr.
  ///
  /// In en, this message translates to:
  /// **'Create an account or'**
  String get createAccountOr;

  /// No description provided for @welcomeBack.
  ///
  /// In en, this message translates to:
  /// **'Welcome back'**
  String get welcomeBack;

  /// No description provided for @signInDisclaimer.
  ///
  /// In en, this message translates to:
  /// **'Sign in to access your patients and insights'**
  String get signInDisclaimer;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgotPassword;

  /// No description provided for @continueWord.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueWord;

  /// No description provided for @dontHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get dontHaveAccount;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get signIn;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @lastName.
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get lastName;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'E-mail'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// No description provided for @invalidEmail.
  ///
  /// In en, this message translates to:
  /// **'Invalid E-mail'**
  String get invalidEmail;

  /// No description provided for @passwordsDoNotMatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwordsDoNotMatch;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @unknownError.
  ///
  /// In en, this message translates to:
  /// **'Unknown Error'**
  String get unknownError;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'Ok'**
  String get ok;

  /// No description provided for @emailAlreadyInUseError.
  ///
  /// In en, this message translates to:
  /// **'This email is already in use. Please use a different one or sign in instead.'**
  String get emailAlreadyInUseError;

  /// No description provided for @invalidEmailError.
  ///
  /// In en, this message translates to:
  /// **'The email address you entered is not valid. Please check and try again.'**
  String get invalidEmailError;

  /// No description provided for @weakPasswordError.
  ///
  /// In en, this message translates to:
  /// **'Your password is too weak. Try using a mix of letters, numbers, and symbols.'**
  String get weakPasswordError;

  /// No description provided for @unknownSignUpError.
  ///
  /// In en, this message translates to:
  /// **'An unexpected error occurred during sign up. Please try again later.'**
  String get unknownSignUpError;

  /// No description provided for @invalidEmailSignInError.
  ///
  /// In en, this message translates to:
  /// **'The email address you entered is not valid. Please check and try again.'**
  String get invalidEmailSignInError;

  /// No description provided for @userDisabledSignInError.
  ///
  /// In en, this message translates to:
  /// **'This account has been disabled. Please contact support for more information.'**
  String get userDisabledSignInError;

  /// No description provided for @userNotFoundSignInError.
  ///
  /// In en, this message translates to:
  /// **'We couldn’t find an account with this email. Please check the address or sign up.'**
  String get userNotFoundSignInError;

  /// No description provided for @invalidCredentialsSignInError.
  ///
  /// In en, this message translates to:
  /// **'The credentials you entered are invalid. Please check and try again.'**
  String get invalidCredentialsSignInError;

  /// No description provided for @wrongPasswordSignInError.
  ///
  /// In en, this message translates to:
  /// **'The password you entered is incorrect. Please try again.'**
  String get wrongPasswordSignInError;

  /// No description provided for @unknownSignInError.
  ///
  /// In en, this message translates to:
  /// **'An unexpected error occurred during sign in. Please try again later.'**
  String get unknownSignInError;

  /// No description provided for @addNewPatient.
  ///
  /// In en, this message translates to:
  /// **'Add New Patient'**
  String get addNewPatient;

  /// No description provided for @registerPatientProfile.
  ///
  /// In en, this message translates to:
  /// **'Register a new patient profile'**
  String get registerPatientProfile;

  /// No description provided for @greetings.
  ///
  /// In en, this message translates to:
  /// **'Good {timeOfDay}, {name}'**
  String greetings(String timeOfDay, String name);

  /// No description provided for @patientsNeedAttention.
  ///
  /// In en, this message translates to:
  /// **'{numberOfPatientsNeedAttention} patients need attention today'**
  String patientsNeedAttention(int numberOfPatientsNeedAttention);

  /// No description provided for @addProfilePicture.
  ///
  /// In en, this message translates to:
  /// **'Add profile picture'**
  String get addProfilePicture;

  /// No description provided for @optional.
  ///
  /// In en, this message translates to:
  /// **'Optional'**
  String get optional;

  /// No description provided for @genderMale.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get genderMale;

  /// No description provided for @genderFemale.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get genderFemale;

  /// No description provided for @genderOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get genderOther;

  /// No description provided for @basicInformation.
  ///
  /// In en, this message translates to:
  /// **'Basic information'**
  String get basicInformation;

  /// No description provided for @demographics.
  ///
  /// In en, this message translates to:
  /// **'Demographics'**
  String get demographics;

  /// No description provided for @notes.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get notes;

  /// No description provided for @fullNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Full name'**
  String get fullNameLabel;

  /// No description provided for @fullNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Name is required'**
  String get fullNameRequired;

  /// No description provided for @birthDateLabel.
  ///
  /// In en, this message translates to:
  /// **'Date of birth'**
  String get birthDateLabel;

  /// No description provided for @birthDateHint.
  ///
  /// In en, this message translates to:
  /// **'DD / MM / YYYY'**
  String get birthDateHint;

  /// No description provided for @genderLabel.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get genderLabel;

  /// No description provided for @notesHint.
  ///
  /// In en, this message translates to:
  /// **'Additional information, allergies, observations...'**
  String get notesHint;

  /// No description provided for @savePatient.
  ///
  /// In en, this message translates to:
  /// **'Save patient'**
  String get savePatient;

  /// No description provided for @phone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get phone;

  /// No description provided for @missingRequiredInformation.
  ///
  /// In en, this message translates to:
  /// **'Missing required information'**
  String get missingRequiredInformation;

  /// No description provided for @contactInformation.
  ///
  /// In en, this message translates to:
  /// **'Contact Information'**
  String get contactInformation;

  /// No description provided for @extraInformation.
  ///
  /// In en, this message translates to:
  /// **'Extra Information'**
  String get extraInformation;

  /// No description provided for @addPatient.
  ///
  /// In en, this message translates to:
  /// **'Add Patient'**
  String get addPatient;

  /// No description provided for @searchPatients.
  ///
  /// In en, this message translates to:
  /// **'Search Patients'**
  String get searchPatients;

  /// No description provided for @allPatients.
  ///
  /// In en, this message translates to:
  /// **'All Patients'**
  String get allPatients;

  /// No description provided for @patientAgeGender.
  ///
  /// In en, this message translates to:
  /// **'{age, plural, one{{age} year} other{{age} years}} • {gender}'**
  String patientAgeGender(num age, Object gender);

  /// No description provided for @patientLastVisit.
  ///
  /// In en, this message translates to:
  /// **'Last visit: {date}'**
  String patientLastVisit(Object date);

  /// No description provided for @appointments.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{No appointments} =1{Appointment} other{Appointments}}'**
  String appointments(num count);

  /// No description provided for @scheduleAppointment.
  ///
  /// In en, this message translates to:
  /// **'Schedule Appointment'**
  String get scheduleAppointment;

  /// No description provided for @patientsRequiringAttention.
  ///
  /// In en, this message translates to:
  /// **'Patients requiring attention'**
  String get patientsRequiringAttention;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @calendar.
  ///
  /// In en, this message translates to:
  /// **'Calendar'**
  String get calendar;

  /// No description provided for @reports.
  ///
  /// In en, this message translates to:
  /// **'Reports'**
  String get reports;

  /// No description provided for @appointmentTypeConsultation.
  ///
  /// In en, this message translates to:
  /// **'Consultation'**
  String get appointmentTypeConsultation;

  /// No description provided for @appointmentTypeFollowUp.
  ///
  /// In en, this message translates to:
  /// **'Follow-up'**
  String get appointmentTypeFollowUp;

  /// No description provided for @appointmentTypeExam.
  ///
  /// In en, this message translates to:
  /// **'Exam'**
  String get appointmentTypeExam;

  /// No description provided for @other.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get other;

  /// No description provided for @appointmentDetails.
  ///
  /// In en, this message translates to:
  /// **'Appointment details'**
  String get appointmentDetails;

  /// No description provided for @patient.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{No patients} =1{Patient} other{Patients}}'**
  String patient(num count);

  /// No description provided for @appointmentType.
  ///
  /// In en, this message translates to:
  /// **'Appointment type'**
  String get appointmentType;

  /// No description provided for @date.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get date;

  /// No description provided for @time.
  ///
  /// In en, this message translates to:
  /// **'Time'**
  String get time;

  /// No description provided for @pending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get pending;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'pt':
      return AppLocalizationsPt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
