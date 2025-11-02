import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medpal/core/presentation/dialogs/mp_error_dialog.dart';
import 'package:medpal/core/presentation/mp_loading.dart';
import 'package:medpal/core/presentation/mp_ui_constants.dart';
import 'package:medpal/core/presentation/theme_extensions.dart';
import 'package:medpal/core/routing/mp_route.dart';
import 'package:medpal/core/utils/mp_string_utils.dart';
import 'package:medpal/core/utils/mp_validators.dart';
import 'package:medpal/features/auth/presentation/sign_up/cubit/sign_up_cubit.dart';
import 'package:medpal/features/auth/presentation/sign_up/cubit/sign_up_presentation_events.dart';
import 'package:medpal/features/auth/presentation/sign_up/cubit/sign_up_state.dart';
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
    final cubit = context.read<SignUpCubit>();
    return BlocPresentationListener<SignUpCubit, SignUpPresentationEvent>(
      listener: (context, event) {
        switch (event) {
          case ShowLoadingEvent():
            context.showLoading();
          case HideLoadingEvent():
            context.hideLoading();
          case UserSignedUpEvent():
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
      child: BlocBuilder<SignUpCubit, SignUpState>(
        builder: (context, state) => Scaffold(
          body: Padding(
            padding: MPUiConstants.paddingHorizontal(16),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(l10n.signUp, style: context.textTheme.headlineMedium),
                  Row(
                    children: [
                      Text(l10n.createAccountOr),
                      TextButton(
                        onPressed: () => context.pushNamed(MPRoute.signIn.name),
                        style: const ButtonStyle(padding: WidgetStatePropertyAll(EdgeInsets.zero)),
                        child: Text(l10n.signIn),
                      ),
                    ],
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: l10n.name, floatingLabelBehavior: FloatingLabelBehavior.always),
                    maxLength: 16,
                    onChanged: cubit.changeName,
                  ),
                  MPUiConstants.gapMD,
                  TextFormField(
                    decoration: InputDecoration(labelText: l10n.lastName, floatingLabelBehavior: FloatingLabelBehavior.always),
                    maxLength: 16,
                    onChanged: cubit.changeLastName,
                  ),
                  MPUiConstants.gapMD,
                  TextFormField(
                    decoration: InputDecoration(labelText: l10n.email, floatingLabelBehavior: FloatingLabelBehavior.always),
                    onChanged: cubit.changeEmail,
                    validator: (email) => MPValidators.emailValidator(email, errorMessage: l10n.invalidEmail),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  MPUiConstants.gapXL,
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: l10n.password,
                      floatingLabelBehavior: FloatingLabelBehavior.always,
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
                      floatingLabelBehavior: FloatingLabelBehavior.always,
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
                  MPUiConstants.gapXL,
                  FilledButton(onPressed: state.isFormValid ? cubit.signUp : null, child: Text(l10n.signUp)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
