import 'package:flutter/material.dart';
import 'package:medpal/core/presentation/dialogs/mp_error_dialog.dart';
import 'package:medpal/core/presentation/general/mp_loading.dart';
import 'package:medpal/core/presentation/general/mp_page.dart';
import 'package:medpal/features/appointment/presentation/create/cubit/create_appointment_cubit.dart';
import 'package:medpal/features/appointment/presentation/create/cubit/create_appointment_presentation_events.dart';
import 'package:medpal/features/appointment/presentation/create/cubit/create_appointment_state.dart';

class CreateAppointmentPage extends StatelessWidget {
  const CreateAppointmentPage({super.key});

  @override
  Widget build(BuildContext context) => MPPage<CreateAppointmentCubit, CreateAppointmentState, CreateAppointmentPresentationEvent>(
    onPresentationEvent: (context, event) {
      switch (event) {
        case ShowLoadingEvent():
          context.showLoading();
        case HideLoadingEvent():
          context.hideLoading();
        case ErrorEvent():
          showErrorDialog(context, message: event.errorMessage);
      }
    },
    builder: (context, cubit, state) => const Scaffold(),
  );
}
