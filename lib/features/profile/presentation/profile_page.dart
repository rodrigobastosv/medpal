import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medpal/core/presentation/dialogs/mp_error_dialog.dart';
import 'package:medpal/core/presentation/mp_loading.dart';
import 'package:medpal/core/presentation/mp_page.dart';
import 'package:medpal/core/routing/mp_route.dart';
import 'package:medpal/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:medpal/features/profile/presentation/cubit/profile_presentation_events.dart';
import 'package:medpal/features/profile/presentation/cubit/profile_state.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) => MPPage<ProfileCubit, ProfileState, ProfilePresentationEvent>(
    onPresentationEvent: (context, event) {
      switch (event) {
        case ShowLoadingEvent():
          context.showLoading();
        case HideLoadingEvent():
          context.hideLoading();
        case ErrorEvent():
          showErrorDialog(context, message: event.errorMessage);
        case UserSignedOutEvent():
          context.goNamed(MPRoute.welcome.name);
      }
    },
    builder: (context, cubit, state) => Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [FilledButton(onPressed: cubit.signOut, child: const Text('Logout'))],
      ),
    ),
  );
}
