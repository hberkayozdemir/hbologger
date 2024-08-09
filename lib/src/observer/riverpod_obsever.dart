import 'package:hbologger/hbologger.dart';
import 'package:riverpod/riverpod.dart';
import 'package:hbologger/src/log_level_enum.dart';

class LoggerObserver extends ProviderObserver {
  final Logging loggerChain;

  LoggerObserver()
      : loggerChain = DebugLogger()
          ..setNextLogger(InfoLogger())
          ..setNextLogger(ErrorLogger());

  @override
  void didAddProvider(ProviderBase provider, Object? value, ProviderContainer container) {
    super.didAddProvider(provider, value, container);
    loggerChain.logMessage(
      'Provider added: ${provider.name ?? provider.runtimeType}',
      LogLevel.INFO,
    );
    loggerChain.logMessage('Initial value: $value', LogLevel.DEBUG);
  }

  @override
  void didUpdateProvider(ProviderBase provider, Object? previousValue, Object? newValue, ProviderContainer container) {
    super.didUpdateProvider(provider, previousValue, newValue, container);
    loggerChain.logMessage(
      'Provider updated: ${provider.name ?? provider.runtimeType}',
      LogLevel.INFO,
    );
    loggerChain.logMessage('Previous value: $previousValue', LogLevel.DEBUG);
    loggerChain.logMessage('New value: $newValue', LogLevel.DEBUG);
  }

  @override
  void didDisposeProvider(ProviderBase provider, ProviderContainer container) {
    super.didDisposeProvider(provider, container);
    loggerChain.logMessage(
      'Provider disposed: ${provider.name ?? provider.runtimeType}',
      LogLevel.INFO,
    );
  }

  @override
  void providerDidFail(ProviderBase provider, Object error, StackTrace stackTrace, ProviderContainer container) {
    super.providerDidFail(provider, error, stackTrace, container);
    loggerChain.logMessage(
      'Provider failed: ${provider.name ?? provider.runtimeType}',
      LogLevel.ERROR,
    );
    loggerChain.logMessage('Error: $error', LogLevel.ERROR);
    loggerChain.logMessage('Stack trace: $stackTrace', LogLevel.ERROR);
  }
}
