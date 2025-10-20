import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:medpal/core/presentation/mp_asset.dart';
import 'package:medpal/core/presentation/theme_extensions.dart';
import 'package:medpal/core/routing/mp_route.dart';
import 'package:medpal/features/welcome/presentation/welcome_cubit.dart';
import 'package:medpal/features/welcome/presentation/welcome_presentation_events.dart';
import 'package:medpal/l10n/l10n.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final cubit = context.read<WelcomeCubit>();
    return BlocPresentationListener<WelcomeCubit, WelcomePresentationEvent>(
      listener: (context, event) {
        switch (event) {
          case IntroCompletedEvent():
            context.pushNamed(MPRoute.signIn.name);
        }
      },
      child: Scaffold(
        backgroundColor: context.theme.primaryColor,
        body: IntroductionScreen(
          pages: [
            PageViewModel(title: l10n.step1IntroTitle, body: l10n.step1IntroDescription, image: Image.asset(MPAsset.welcome1)),
            PageViewModel(title: l10n.step2IntroTitle, body: l10n.step2IntroDescription, image: Image.asset(MPAsset.welcome2)),
            PageViewModel(title: l10n.step3IntroTitle, body: l10n.step3IntroDescription, image: Image.asset(MPAsset.welcome3)),
            PageViewModel(title: l10n.step4IntroTitle, body: l10n.step4IntroDescription, image: Image.asset(MPAsset.welcome4)),
          ],
          next: Text(l10n.next),
          done: Text(l10n.done),
          skip: Text(l10n.skip),
          showSkipButton: true,
          onDone: cubit.finishIntro,
        ),
      ),
    );
  }
}
