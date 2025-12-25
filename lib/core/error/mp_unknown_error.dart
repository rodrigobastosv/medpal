import 'package:medpal/core/error/mp_error.dart';
import 'package:medpal/core/routing/mp_router_config.dart';
import 'package:medpal/l10n/l10n.dart';

class MPUnknownError extends MPError {
  MPUnknownError() : super(errorMessage: navigatorKey.currentContext?.l10n.unknownError ?? '');
}
