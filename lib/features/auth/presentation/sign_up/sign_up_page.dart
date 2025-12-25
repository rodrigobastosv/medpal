import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medpal/core/presentation/dialogs/mp_error_dialog.dart';
import 'package:medpal/core/presentation/mp_loading.dart';
import 'package:medpal/core/presentation/mp_page.dart';
import 'package:medpal/core/presentation/mp_ui_constants.dart';
import 'package:medpal/core/presentation/theme_extensions.dart';
import 'package:medpal/core/routing/mp_route.dart';
import 'package:medpal/core/utils/mp_string_utils.dart';
import 'package:medpal/core/utils/mp_validators.dart';
import 'package:medpal/features/auth/presentation/sign_up/cubit/sign_up_cubit.dart';
import 'package:medpal/features/auth/presentation/sign_up/cubit/sign_up_presentation_events.dart';
import 'package:medpal/features/auth/presentation/sign_up/cubit/sign_up_state.dart';
import 'package:medpal/features/auth/presentation/sign_up/widgets/profile_photo_picker.dart';
import 'package:medpal/l10n/l10n.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool hidePassword = true;
  bool hideConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return MPPage<SignUpCubit, SignUpState, SignUpPresentationEvent>(
      onPresentationEvent: (context, event) {
        switch (event) {
          case ShowLoadingEvent():
            context.showLoading();
          case HideLoadingEvent():
            context.hideLoading();
          case UserSignedUpEvent():
            context.goNamed(MPRoute.home.name);
          case EmailAlreadyInUseSignUpErrorEvent():
            showErrorDialog(context, message: l10n.emailAlreadyInUseError);
          case InvalidEmailSignUpErrorEvent():
            showErrorDialog(context, message: l10n.invalidEmailError);
          case WeakPasswordSignUpErrorEvent():
            showErrorDialog(context, message: l10n.weakPasswordError);
          case UnknownSignUpErrorEvent():
            showErrorDialog(context, message: l10n.unknownSignUpError);
        }
      },
      builder: (context, cubit, state) => Scaffold(
        body: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SingleChildScrollView(
              padding: MPUiConstants.paddingHorizontal(MPUiConstants.spacingLG),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  MPUiConstants.gapXL,
                  Text('${l10n.createYourAccount} ✨', style: Theme.of(context).textTheme.headlineSmall, textAlign: TextAlign.center),
                  MPUiConstants.gapSM,
                  Text(
                    l10n.joinMedPal,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black54),
                    textAlign: TextAlign.center,
                  ),
                  MPUiConstants.gapMD,
                  ProfilePhotoPicker(image: state.profilePhoto, onTap: cubit.getProfilePhoto),
                  MPUiConstants.gapMD,
                  TextFormField(
                    decoration: InputDecoration(labelText: l10n.name),
                    maxLength: 16,
                    onChanged: cubit.changeName,
                  ),
                  MPUiConstants.gapMD,
                  TextFormField(
                    decoration: InputDecoration(labelText: l10n.lastName),
                    maxLength: 16,
                    onChanged: cubit.changeLastName,
                  ),
                  MPUiConstants.gapMD,
                  TextFormField(
                    decoration: InputDecoration(labelText: l10n.email),
                    onChanged: cubit.changeEmail,
                    validator: (email) => MPValidators.emailValidator(email, errorMessage: l10n.invalidEmail),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  MPUiConstants.gapXL,
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: l10n.password,
                      hintText: l10n.minimumCharacters(8),
                      suffixIcon: GestureDetector(
                        onTap: () => setState(() => hidePassword = !hidePassword),
                        child: Icon(hidePassword ? Icons.lock_open : Icons.lock),
                      ),
                    ),
                    obscureText: hidePassword,
                    maxLength: 20,
                    onChanged: cubit.changePassword,
                  ),
                  MPUiConstants.gapMD,
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: l10n.confirmPassword,
                      suffixIcon: GestureDetector(
                        onTap: () => setState(() => hideConfirmPassword = !hideConfirmPassword),
                        child: Icon(hidePassword ? Icons.lock_open : Icons.lock),
                      ),
                    ),
                    obscureText: hideConfirmPassword,
                    maxLength: 20,
                    onChanged: cubit.changePasswordConfirmation,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (passwordConfirmation) {
                      if (state.password.isNotNullNorEmpty) {
                        return null;
                      }
                      return MPValidators.matchingPasswordsValidator(
                        state.password,
                        passwordConfirmation,
                        matchingErrorMessage: l10n.passwordsDoNotMatch,
                      );
                    },
                  ),
                  MPUiConstants.gapMD,
                  FilledButton(onPressed: state.isFormValid ? cubit.signUp : null, child: Text(l10n.signUp)),
                  MPUiConstants.gapSM,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('${l10n.alreadyHaveAnAccount}? ', style: context.textTheme.bodyMedium),
                      GestureDetector(
                        onTap: () => context.goNamed(MPRoute.signIn.name),
                        child: Text(
                          l10n.signIn,
                          style: context.textTheme.bodyMedium?.copyWith(color: context.colorScheme.primary, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
