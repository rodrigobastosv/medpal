import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medpal/core/presentation/constants/mp_ui_constants.dart';
import 'package:medpal/core/presentation/dialogs/mp_error_dialog.dart';
import 'package:medpal/core/presentation/general/mp_loading.dart';
import 'package:medpal/core/presentation/general/mp_page.dart';
import 'package:medpal/core/presentation/general/mp_section.dart';
import 'package:medpal/features/appointment/domain/enums/appointment_type.dart';
import 'package:medpal/features/appointment/presentation/create/cubit/create_appointment_cubit.dart';
import 'package:medpal/features/appointment/presentation/create/cubit/create_appointment_presentation_events.dart';
import 'package:medpal/features/appointment/presentation/create/cubit/create_appointment_state.dart';
import 'package:medpal/features/appointment/presentation/create/widgets/appointment_date.dart';
import 'package:medpal/features/appointment/presentation/create/widgets/appointment_time.dart';
import 'package:medpal/features/patient/domain/entities/patient.dart';
import 'package:medpal/l10n/l10n.dart';

class CreateAppointmentPage extends StatelessWidget {
  const CreateAppointmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return MPPage<CreateAppointmentCubit, CreateAppointmentState, CreateAppointmentPresentationEvent>(
      onPresentationEvent: (context, event) {
        switch (event) {
          case ShowLoadingEvent():
            context.showLoading();
          case HideLoadingEvent():
            context.hideLoading();
          case ErrorEvent():
            showErrorDialog(context, message: event.errorMessage);
          case AppointmentCreatedEvent():
            context.pop();
        }
      },
      builder: (context, cubit, state) {
        final theme = Theme.of(context);
        final colorScheme = theme.colorScheme;
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(MPUiConstants.spacingMD, 0, MPUiConstants.spacingMD, MPUiConstants.spacingLG),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MPSection(
                          title: l10n.appointmentDetails,
                          children: [
                            DropdownButtonFormField<Patient>(
                              decoration: InputDecoration(labelText: l10n.patient(1)),
                              initialValue: state.pickedPatient,
                              items: state.patients.map((patient) => DropdownMenuItem(value: patient, child: Text(patient.name))).toList(),
                              onChanged: state.canChangePatient ? (patient) => patient != null ? cubit.changePatient(patient) : null : null,
                            ),
                            MPUiConstants.gapM,
                            DropdownButtonFormField<AppointmentType>(
                              decoration: InputDecoration(labelText: l10n.appointmentType),
                              items: AppointmentType.values
                                  .map((type) => DropdownMenuItem(value: type, child: Text(type.label(l10n))))
                                  .toList(),
                              onChanged: (type) => type != null ? cubit.changeType(type) : null,
                            ),
                            MPUiConstants.gapM,
                            Row(
                              children: [
                                Expanded(
                                  child: AppointmentDate(onDateSelected: cubit.changeDate, label: l10n.date),
                                ),
                                MPUiConstants.gapM,
                                Expanded(
                                  child: AppointmentTime(onTimeSelected: cubit.changeTime, label: l10n.time),
                                ),
                              ],
                            ),
                          ],
                        ),
                        MPSection(
                          title: l10n.notes,
                          children: [
                            TextFormField(
                              onChanged: cubit.changeNotes,
                              maxLines: 4,
                              decoration: InputDecoration(labelText: l10n.notes, alignLabelWithHint: true),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(MPUiConstants.spacingMD, MPUiConstants.spacingM, MPUiConstants.spacingMD, 0),
                  decoration: BoxDecoration(
                    color: colorScheme.surface,
                    border: Border(top: BorderSide(color: colorScheme.outlineVariant)),
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: FilledButton(onPressed: cubit.createAppointment, child: Text(l10n.scheduleAppointment)),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
