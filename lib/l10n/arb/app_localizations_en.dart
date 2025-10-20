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
}
