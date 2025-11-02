import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medpal/core/presentation/dialogs/mp_error_dialog.dart';
import 'package:medpal/core/presentation/mp_loading.dart';
import 'package:medpal/core/presentation/mp_ui_constants.dart';
import 'package:medpal/core/routing/mp_route.dart';
import 'package:medpal/core/utils/mp_validators.dart';
import 'package:medpal/features/auth/presentation/sign_in/cubit/sign_in_cubit.dart';
import 'package:medpal/features/auth/presentation/sign_in/cubit/sign_in_presentation_events.dart';
import 'package:medpal/features/auth/presentation/sign_in/cubit/sign_in_state.dart';
import 'package:medpal/l10n/l10n.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final cubit = context.read<SignInCubit>();
    return BlocPresentationListener<SignInCubit, SignInPresentationEvent>(
      listener: (context, event) {
        switch (event) {
          case ShowLoadingEvent():
            context.showLoading();
          case HideLoadingEvent():
            context.hideLoading();
          case UserSignedInEvent():
            context.goNamed(MPRoute.home.name);
          case InvalidEmailSignInErrorEvent():
            showErrorDialog(context, message: l10n.invalidEmailSignInError);
          case UserDisabledSignInErrorEvent():
            showErrorDialog(context, message: l10n.userDisabledSignInError);
          case UserNotFoundSignInErrorEvent():
            showErrorDialog(context, message: l10n.userNotFoundSignInError);
          case InvalidCredentialsSignInErrorEvent():
            showErrorDialog(context, message: l10n.invalidCredentialsSignInError);
          case WrongPasswordSignInErrorEvent():
            showErrorDialog(context, message: l10n.wrongPasswordSignInError);
          case UnknownSignUpErrorEvent():
            showErrorDialog(context, message: l10n.unknownSignInError);
        }
      },
      child: BlocBuilder<SignInCubit, SignInState>(
        builder: (context, state) => Scaffold(
          body: Padding(
            padding: MPUiConstants.paddingHorizontal(16),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                  MPUiConstants.gapXL,
                  FilledButton(onPressed: state.isFormValid ? cubit.signIn : null, child: Text(l10n.signIn)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
