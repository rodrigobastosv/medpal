import 'package:medpal/l10n/arb/app_localizations.dart';

enum AppointmentType {
  consultation('consultation'),
  followUp('follow_up'),
  exam('exam'),
  other('other');

  const AppointmentType(this.value);

  final String value;

  static AppointmentType fromValue(String value) =>
      AppointmentType.values.firstWhere((type) => type.value == value, orElse: () => AppointmentType.other);

  String label(AppLocalizations l10n) => switch (this) {
    AppointmentType.consultation => l10n.appointmentTypeConsultation,
    AppointmentType.followUp => l10n.appointmentTypeFollowUp,
    AppointmentType.exam => l10n.appointmentTypeExam,
    AppointmentType.other => l10n.other,
  };
}
