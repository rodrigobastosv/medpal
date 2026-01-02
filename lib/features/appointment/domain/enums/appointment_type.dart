import 'package:json_annotation/json_annotation.dart';
import 'package:medpal/l10n/arb/app_localizations.dart';

enum AppointmentType {
  @JsonValue('consultation')
  consultation('consultation'),
  @JsonValue('follow_up')
  followUp('follow_up'),
  @JsonValue('exam')
  exam('exam'),
  @JsonValue('other')
  other('other');

  const AppointmentType(this.value);
  final String value;

  String label(AppLocalizations l10n) => switch (this) {
    AppointmentType.consultation => l10n.appointmentTypeConsultation,
    AppointmentType.followUp => l10n.appointmentTypeFollowUp,
    AppointmentType.exam => l10n.appointmentTypeExam,
    AppointmentType.other => l10n.other,
  };
}
