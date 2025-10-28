import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medpal/core/presentation/mp_ui_constants.dart';
import 'package:medpal/features/auth/presentation/sign_up/cubit/sign_up_cubit.dart';
import 'package:medpal/features/auth/presentation/sign_up/cubit/sign_up_presentation_events.dart';
import 'package:medpal/features/auth/presentation/sign_up/cubit/sign_up_state.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignUpCubit>();
    return BlocPresentationListener<SignUpCubit, SignUpPresentationEvent>(
      listener: (context, event) {
        switch (event) {
          case UserSignedUpEvent():
          case EmailAlreadyInUseSignUpError():
          case InvalidEmailSignUpError():
          case WeakPasswordSignUpError():
          case UnknownSignUpError():
        }
      },
      child: BlocBuilder<SignUpCubit, SignUpState>(
        builder: (context, state) => Scaffold(
          appBar: AppBar(title: const Text('Sign-Up')),
          body: Padding(
            padding: MPUiConstants.paddingHorizontal(16),
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(hintText: 'E-mail'),
                  onChanged: cubit.changeEmail,
                ),
                MPUiConstants.gapMD,
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Password'),
                  onChanged: cubit.changePassword,
                ),
                MPUiConstants.gapXL,
                FilledButton(onPressed: cubit.signUp, child: const Text('Create Account')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
