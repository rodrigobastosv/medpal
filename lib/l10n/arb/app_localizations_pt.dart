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

  @override
  String get createYourAccount => 'Cria sua conta';

  @override
  String get joinMedPal => 'Junte-se ao MedPal e comece a gerenciar seus pacientes';

  @override
  String minimumCharacters(int qty) {
    return 'Mínimo $qty caracteres';
  }

  @override
  String get alreadyHaveAnAccount => 'Já tem uma conta?';

  @override
  String get signUp => 'Criar Conta';

  @override
  String get createAccountOr => 'Criar conta ou';

  @override
  String get welcomeBack => 'Bem-vindo de volta';

  @override
  String get signInDisclaimer => 'Faça login para acessar seus pacientes e insights';

  @override
  String get forgotPassword => 'Esqueceu a senha?';

  @override
  String get continueWord => 'Continuar';

  @override
  String get dontHaveAccount => 'Não tem uma conta?';

  @override
  String get signIn => 'Entrar';

  @override
  String get name => 'Nome';

  @override
  String get lastName => 'Sobrenome';

  @override
  String get email => 'E-mail';

  @override
  String get password => 'Senha';

  @override
  String get confirmPassword => 'Confirme a Senha';

  @override
  String get invalidEmail => 'E-mail Inválido';

  @override
  String get passwordsDoNotMatch => 'As senhas não coincidem';

  @override
  String get error => 'Erro';

  @override
  String get unknownError => 'Erro desconhecido';

  @override
  String get ok => 'Ok';

  @override
  String get emailAlreadyInUseError => 'Este e-mail já está em uso. Use um diferente ou faça login.';

  @override
  String get invalidEmailError => 'O endereço de e-mail informado não é válido. Verifique e tente novamente.';

  @override
  String get weakPasswordError => 'Sua senha é muito fraca. Tente usar uma combinação de letras, números e símbolos.';

  @override
  String get unknownSignUpError => 'Ocorreu um erro inesperado durante o cadastro. Tente novamente mais tarde.';

  @override
  String get invalidEmailSignInError => 'O endereço de e-mail informado não é válido. Verifique e tente novamente.';

  @override
  String get userDisabledSignInError => 'Esta conta foi desativada. Entre em contato com o suporte para mais informações.';

  @override
  String get userNotFoundSignInError => 'Não encontramos uma conta com este e-mail. Verifique o endereço ou cadastre-se.';

  @override
  String get invalidCredentialsSignInError => 'As credenciais fornecidas são inválidas. Verifique e tente novamente.';

  @override
  String get wrongPasswordSignInError => 'A senha informada está incorreta. Tente novamente.';

  @override
  String get unknownSignInError => 'Ocorreu um erro inesperado durante o login. Tente novamente mais tarde.';

  @override
  String get addNewPatient => 'Adicionar novo paciente';

  @override
  String get registerPatientProfile => 'Cadastrar um novo perfil de paciente';

  @override
  String greetings(String timeOfDay, String name) {
    return 'Boa $timeOfDay, $name';
  }

  @override
  String patientsNeedAtention(int numberOfPatientsNeedAttention) {
    return '$numberOfPatientsNeedAttention pacientes precisam de atenção hoje';
  }

  @override
  String get addProfilePicture => 'Adicionar foto de perfil';

  @override
  String get optional => 'Opcional';

  @override
  String get genderMale => 'Masculino';

  @override
  String get genderFemale => 'Feminino';

  @override
  String get genderOther => 'Outro';

  @override
  String get basicInformation => 'Informações básicas';

  @override
  String get demographics => 'Dados demográficos';

  @override
  String get notes => 'Observações';

  @override
  String get fullNameLabel => 'Nome completo';

  @override
  String get fullNameRequired => 'Nome é obrigatório';

  @override
  String get birthDateLabel => 'Data de nascimento';

  @override
  String get birthDateHint => 'DD / MM / AAAA';

  @override
  String get genderLabel => 'Gênero';

  @override
  String get notesHint => 'Informações adicionais, alergias, observações...';

  @override
  String get savePatient => 'Salvar paciente';
}
