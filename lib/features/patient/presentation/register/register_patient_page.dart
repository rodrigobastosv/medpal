import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:medpal/core/presentation/constants/mp_ui_constants.dart';
import 'package:medpal/core/presentation/dialogs/mp_error_dialog.dart';
import 'package:medpal/core/presentation/general/mp_loading.dart';
import 'package:medpal/core/presentation/general/mp_page.dart';
import 'package:medpal/core/presentation/general/mp_section.dart';
import 'package:medpal/core/utils/mp_validators.dart';
import 'package:medpal/features/patient/domain/enums/gender.dart';
import 'package:medpal/features/patient/presentation/register/cubit/register_patient_cubit.dart';
import 'package:medpal/features/patient/presentation/register/cubit/register_patient_presentation_events.dart';
import 'package:medpal/features/patient/presentation/register/cubit/register_patient_state.dart';
import 'package:medpal/l10n/l10n.dart';

class RegisterPatientPage extends StatefulWidget {
  const RegisterPatientPage({super.key});

  @override
  State<RegisterPatientPage> createState() => _RegisterPatientPageState();
}

class _RegisterPatientPageState extends State<RegisterPatientPage> {
  final _birthDateController = TextEditingController();

  @override
  void dispose() {
    _birthDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return MPPage<RegisterPatientCubit, RegisterPatientState, RegisterPatientPresentationEvent>(
      onPresentationEvent: (context, event) {
        switch (event) {
          case ShowLoadingEvent():
            context.showLoading();
          case HideLoadingEvent():
            context.hideLoading();
          case ErrorEvent():
            showErrorDialog(context, message: event.errorMessage);
          case IncompleteInformationErrorEvent():
            showErrorDialog(context, message: l10n.missingRequiredInformation);
          case PatientRegisteredEvent():
            context.pop();
        }
      },
      builder: (context, cubit, state) => Scaffold(
        body: Padding(
          padding: MPUiConstants.paddingHorizontal(MPUiConstants.spacingLG),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  MPSection(
                    title: l10n.basicInformation,
                    children: [
                      TextFormField(
                        decoration: InputDecoration(labelText: l10n.fullNameLabel),
                        onChanged: cubit.changeName,
                        validator: (name) => MPValidators.requiredFieldValidator(name, errorMessage: l10n.fullNameRequired),
                      ),
                      MPUiConstants.gapMD,
                      TextFormField(
                        controller: _birthDateController,
                        readOnly: true,
                        decoration: InputDecoration(
                          labelText: l10n.birthDateLabel,
                          hintText: l10n.birthDateHint,
                          suffixIcon: const Icon(Icons.calendar_today),
                        ),
                        onTap: () async {
                          final now = DateTime.now();
                          final pickedDateTime = await showDatePicker(
                            context: context,
                            initialDate: DateTime(now.year),
                            firstDate: DateTime(1900),
                            lastDate: now,
                          );

                          if (pickedDateTime != null) {
                            _birthDateController.text =
                                '${pickedDateTime.day.toString().padLeft(2, '0')}/'
                                '${pickedDateTime.month.toString().padLeft(2, '0')}/'
                                '${pickedDateTime.year}';
                            cubit.changeDateOfBirth(pickedDateTime);
                          }
                        },
                      ),
                    ],
                  ),
                  MPSection(
                    title: l10n.contactInformation,
                    children: [
                      TextFormField(
                        decoration: InputDecoration(labelText: l10n.name),
                        onChanged: cubit.changeContactName,
                      ),
                      MPUiConstants.gapM,
                      InternationalPhoneNumberInput(
                        onInputChanged: (number) => cubit.changePhoneNumber(number.phoneNumber),
                        keyboardType: const TextInputType.numberWithOptions(signed: true, decimal: true),
                        countries: const ['US', 'BR'],
                        inputDecoration: InputDecoration(labelText: l10n.phone, floatingLabelBehavior: FloatingLabelBehavior.always),
                      ),
                    ],
                  ),
                  MPSection(
                    title: l10n.demographics,
                    children: [
                      DropdownButtonFormField<Gender>(
                        decoration: InputDecoration(labelText: l10n.genderLabel),
                        items: Gender.values.map((gender) => DropdownMenuItem(value: gender, child: Text(gender.label(l10n)))).toList(),
                        onChanged: cubit.changeGender,
                      ),
                    ],
                  ),
                  MPSection(
                    title: l10n.extraInformation,
                    children: [
                      TextFormField(
                        maxLines: 4,
                        decoration: InputDecoration(labelText: l10n.notes, hintText: l10n.notesHint),
                        onChanged: cubit.changeNotes,
                      ),
                    ],
                  ),
                  MPUiConstants.gapXL,
                  FilledButton(onPressed: cubit.registerPatient, child: Text(l10n.savePatient)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
