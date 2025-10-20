// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get step1IntroTitle => 'Mantenha-se Conectado com Seus Pacientes';

  @override
  String get step1IntroDescription =>
      'O MedPal ajuda você a manter contato com seus pacientes a qualquer hora e em qualquer lugar — de forma segura e simples.';

  @override
  String get step2IntroTitle => 'Simplifique Sua Agenda';

  @override
  String get step2IntroDescription =>
      'Visualize, confirme e organize suas consultas diárias em um só lugar — sem agendamentos duplicados ou sessões perdidas.';

  @override
  String get step3IntroTitle => 'Cuidado Personalizado ao Paciente';

  @override
  String get step3IntroDescription =>
      'Acesse instantaneamente o histórico, medicamentos e atualizações dos pacientes para oferecer um atendimento mais personalizado.';

  @override
  String get step4IntroTitle => 'Seus Dados Estão Sempre Seguros';

  @override
  String get step4IntroDescription =>
      'Suas comunicações e dados de pacientes são criptografados e tratados com os mais altos padrões de privacidade.';

  @override
  String get skip => 'Pular';

  @override
  String get next => 'Próximo';

  @override
  String get done => 'Concluído';
}
