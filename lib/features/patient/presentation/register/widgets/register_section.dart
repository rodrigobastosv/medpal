import 'package:flutter/material.dart';
import 'package:medpal/core/presentation/constants/mp_ui_constants.dart';
import 'package:medpal/features/patient/presentation/register/widgets/section_title.dart';

class RegisterSection extends StatelessWidget {
  const RegisterSection({required this.title, required this.children, super.key});

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) => Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [SectionTitle(title), MPUiConstants.gapM, ...children, MPUiConstants.gapLG],
  );
}
