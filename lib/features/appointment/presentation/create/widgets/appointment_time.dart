import 'package:flutter/material.dart';
import 'package:medpal/core/presentation/constants/mp_ui_constants.dart';

class AppointmentTime extends StatefulWidget {
  const AppointmentTime({required this.label, required this.onTimeSelected, super.key});

  final String label;
  final ValueChanged<TimeOfDay> onTimeSelected;

  @override
  State<AppointmentTime> createState() => _AppointmentTimeState();
}

class _AppointmentTimeState extends State<AppointmentTime> {
  late final TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => TextFormField(
    controller: controller,
    readOnly: true,
    onTap: () async {
      final selectedTime = await showTimePicker(context: context, initialTime: TimeOfDay.now());

      if (selectedTime != null && context.mounted) {
        widget.onTimeSelected(selectedTime);
        controller.text = selectedTime.format(context);
      }
    },
    decoration: InputDecoration(
      labelText: widget.label,
      suffixIcon: const Icon(Icons.access_time_outlined),
      contentPadding: MPUiConstants.paddingMD,
      border: OutlineInputBorder(borderRadius: MPUiConstants.circularRadiusMD),
    ),
  );
}
