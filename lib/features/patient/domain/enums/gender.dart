import 'package:medpal/l10n/arb/app_localizations.dart';

enum Gender {
  male,
  female,
  other;

  String label(AppLocalizations l10n) => switch (this) {
    Gender.male => l10n.genderMale,
    Gender.female => l10n.genderFemale,
    Gender.other => l10n.genderOther,
  };
}
