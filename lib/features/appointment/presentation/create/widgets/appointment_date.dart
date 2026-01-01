import 'package:flutter/material.dart';
import 'package:medpal/core/presentation/constants/mp_ui_constants.dart';

class AppointmentDate extends StatefulWidget {
  const AppointmentDate({required this.label, required this.onDateSelected, super.key});

  final String label;
  final ValueChanged<DateTime> onDateSelected;

  @override
  State<AppointmentDate> createState() => _AppointmentDateState();
}

class _AppointmentDateState extends State<AppointmentDate> {
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
      final now = DateTime.now();

      final selectedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: now,
        lastDate: now.add(const Duration(days: 365)),
      );

      if (selectedDate != null) {
        widget.onDateSelected(selectedDate);
        controller.text = '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}';
      }
    },
    decoration: InputDecoration(
      labelText: widget.label,
      suffixIcon: const Icon(Icons.calendar_today_outlined),
      contentPadding: MPUiConstants.paddingMD,
      border: OutlineInputBorder(borderRadius: MPUiConstants.circularRadiusMD),
    ),
  );
}
