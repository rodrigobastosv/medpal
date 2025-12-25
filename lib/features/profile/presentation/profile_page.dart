import 'package:flutter/material.dart';
import 'package:medpal/core/presentation/constants/mp_ui_constants.dart';
import 'package:medpal/core/presentation/dialogs/mp_error_dialog.dart';
import 'package:medpal/core/presentation/general/mp_loading.dart';
import 'package:medpal/core/presentation/general/mp_page.dart';
import 'package:medpal/core/presentation/general/mp_user_avatar.dart';
import 'package:medpal/core/routing/mp_route.dart';
import 'package:medpal/core/routing/mp_routing_extensions.dart';
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
          context.goRoute(MPRoute.welcome);
      }
    },
    builder: (context, cubit, state) => Scaffold(
      body: SafeArea(
        child: Padding(
          padding: MPUiConstants.paddingHorizontal(MPUiConstants.spacingLG),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MPUserAvatar(user: state.user, size: MPUiConstants.spacingXXL, onTapAvatar: () {}),
              FilledButton(onPressed: cubit.signOut, child: const Text('Logout')),
            ],
          ),
        ),
      ),
    ),
  );
}
