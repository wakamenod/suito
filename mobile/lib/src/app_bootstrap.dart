import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suito/i18n/translations.g.dart';
import 'package:suito/src/exceptions/async_error_logger.dart';
import 'package:suito/src/exceptions/error_logger.dart';

import 'app.dart';

/// Helper class to initialize services and configure the error handlers
class AppBootstrap {
  Future<ProviderContainer> createFakeDioProviderContainer(
      {bool addDelay = true}) async {
    // final transactionMonthsRepository =
    //     FakeTransactionMonthsRepository(addDelay: addDelay);
    // final fakeScheduleRepository = FakeSchedulesRepository();
    // final fakeExpenseScheduleDetailRepository =
    //     FakeExpenseScheduleDetailRepository();
    // final fakeIncomeScheduleDetailRepository =
    //     FakeIncomeScheduleDetailRepository();

    return ProviderContainer(
      overrides: [
        // transactionMonthsRepositoryProvider
        //     .overrideWithValue(transactionMonthsRepository),
        // schedulesRepositoryProvider.overrideWithValue(fakeScheduleRepository),
        // expenseScheduleDetailRepositoryProvider
        //     .overrideWithValue(fakeExpenseScheduleDetailRepository),
        // incomeScheduleDetailRepositoryProvider
        //     .overrideWithValue(fakeIncomeScheduleDetailRepository),
      ],
      observers: [AsyncErrorLogger()],
    );
  }

  Widget createRootWidget({required ProviderContainer container}) {
    final errorLogger = container.read(errorLoggerProvider);
    registerErrorHandlers(errorLogger);

    return TranslationProvider(
      child: UncontrolledProviderScope(
        container: container,
        child: const MyApp(),
      ),
    );
  }

  void registerErrorHandlers(ErrorLogger errorLogger) {
    // * Show some error UI if any uncaught exception happens
    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.presentError(details);
      errorLogger.logError(details.exception, details.stack);
    };
    // * Handle errors from the underlying platform/OS
    PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
      errorLogger.logError(error, stack);
      return true;
    };
    // * Show some error UI when any widget in the app fails to build
    ErrorWidget.builder = (FlutterErrorDetails details) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text('An error occurred'),
        ),
        body: Center(child: Text(details.toString())),
      );
    };
  }
}
