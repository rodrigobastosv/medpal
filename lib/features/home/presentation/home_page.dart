import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medpal/core/presentation/mp_ui_constants.dart';
import 'package:medpal/features/auth/domain/entities/user.dart';
import 'package:medpal/features/home/presentation/cubit/home_cubit.dart';
import 'package:medpal/features/home/presentation/cubit/home_state.dart';
import 'package:medpal/features/home/presentation/widgets/add_patient_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => BlocBuilder<HomeCubit, HomeState>(
    builder: (context, state) => Scaffold(
      body: Padding(
        padding: MPUiConstants.paddingHorizontal(16),
        child: SafeArea(
          child: Column(
            children: [
              if (state.user case AuthenticatedUser(profilePhotoUrl: final profilePhotoUrl?)) ...[
                Align(
                  alignment: Alignment.centerRight,
                  child: CircleAvatar(backgroundImage: NetworkImage(profilePhotoUrl)),
                ),
                MPUiConstants.gapSM,
              ],
              AddPatientCard(onTap: () {}),
            ],
          ),
        ),
      ),
    ),
  );
}
