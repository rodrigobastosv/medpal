import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:medpal/core/presentation/theme_extensions.dart';
import 'package:medpal/l10n/l10n.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      backgroundColor: context.theme.primaryColor,
      body: IntroductionScreen(
        pages: [
          PageViewModel(title: l10n.step1IntroTitle, body: l10n.step1IntroDescription, image: Image.asset('assets/images/welcome1.png')),
          PageViewModel(title: l10n.step2IntroTitle, body: l10n.step2IntroDescription, image: Image.asset('assets/images/welcome2.png')),
          PageViewModel(title: l10n.step3IntroTitle, body: l10n.step3IntroDescription, image: Image.asset('assets/images/welcome3.png')),
          PageViewModel(title: l10n.step4IntroTitle, body: l10n.step4IntroDescription, image: Image.asset('assets/images/welcome4.png')),
        ],
        next: Text(l10n.next),
        done: Text(l10n.done),
        skip: Text(l10n.skip),
        showSkipButton: true,
        onDone: () {},
      ),
    );
  }
}
