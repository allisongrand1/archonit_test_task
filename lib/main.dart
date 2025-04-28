import 'dart:async';

import 'package:archonit_test_task/application.dart';
import 'package:archonit_test_task/core/di/providers_wrapper.dart';
import 'package:archonit_test_task/core/infrastructure.dart';
import 'package:flutter/material.dart';

import 'core/di/di.dart';
import 'core/errors/error_observer.dart';

void main() {
  final errorObserver = ErrorObserver();

  runZonedGuarded(() {
    final infrastructure = Infrastructure.base();

    final di = DI.base(infrastructure);

    runApp(ProvidersWrapper(di: di, child: Application()));
  }, errorObserver.handleError);
}
