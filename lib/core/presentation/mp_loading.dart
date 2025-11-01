import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';

extension BuildContextExt on BuildContext {
  void showLoading() => loaderOverlay.show(widgetBuilder: (progress) => const Center(child: CircularProgressIndicator()));

  void hideLoading() => loaderOverlay.hide();
}
