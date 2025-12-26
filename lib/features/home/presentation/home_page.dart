import 'package:flutter/material.dart';
import 'package:medpal/core/presentation/general/mp_page.dart';
import 'package:medpal/core/routing/mp_route.dart';
import 'package:medpal/core/routing/mp_routing_extensions.dart';
import 'package:medpal/features/home/presentation/cubit/home_cubit.dart';
import 'package:medpal/features/home/presentation/cubit/home_presentation_events.dart';
import 'package:medpal/features/home/presentation/cubit/home_state.dart';
import 'package:medpal/features/home/presentation/widgets/add_patient_button.dart';
import 'package:medpal/features/home/presentation/widgets/home_header.dart';
import 'package:medpal/features/home/presentation/widgets/overview_stats.dart';
import 'package:medpal/features/home/presentation/widgets/patients_actions.dart';
import 'package:medpal/features/home/presentation/widgets/quick_actions_bottom_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => MPPage<HomeCubit, HomeState, HomePresentationEvent>(
    builder: (context, cubit, state) => Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            HomeHeader(user: state.user, onTapProfile: () => context.pushRoute(MPRoute.profile)),
            AddPatientButton(onTap: () => context.pushRoute(MPRoute.registerPatient)),
            OverviewStats(patients: state.patients),
            const PatientsActions(),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(child: QuickActionsBottomBar(patients: state.patients)),
    ),
  );
}
