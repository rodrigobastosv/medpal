import 'dart:async';

import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MPPage<C extends BlocPresentationMixin<S, E>, S, E> extends StatelessWidget {
  const MPPage({required this.builder, this.onPresentationEvent, super.key});

  final Widget Function(BuildContext context, C cubit, S state) builder;
  final FutureOr<void> Function(BuildContext context, E event)? onPresentationEvent;

  @override
  Widget build(BuildContext context) {
    if (onPresentationEvent case final onPresentationEvent?) {
      return BlocPresentationListener<C, E>(
        key: const Key('listener'),
        listener: onPresentationEvent,
        child: BlocBuilder<C, S>(builder: (context, state) => Builder(builder: (context) => builder(context, context.read<C>(), state))),
      );
    }
    return BlocBuilder<C, S>(builder: (context, state) => Builder(builder: (context) => builder(context, context.read<C>(), state)));
  }
}
