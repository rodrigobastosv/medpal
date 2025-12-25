import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medpal/core/routing/mp_route.dart';

extension BuildContextExt on BuildContext {
  void pushRoute(MPRoute route, {Object? extra}) {
    pushNamed(route.name, extra: extra);
  }

  void goRoute(MPRoute route, {Object? extra}) {
    goNamed(route.name, extra: extra);
  }
}
