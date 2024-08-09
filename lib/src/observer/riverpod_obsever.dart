import 'package:hbologger/src/used_plugin.dart';
import 'package:riverpod/riverpod.dart';

class LoggerObserver extends ProviderObserver {
  @override
  void didAddProvider(ProviderBase provider, Object? value, ProviderContainer container) {
    super.didAddProvider(provider, value, container);
    logger.i('Provider added: ${provider.name ?? provider.runtimeType}');
    logger.d('Initial value: $value');
  }

  @override
  void didUpdateProvider(ProviderBase provider, Object? previousValue, Object? newValue, ProviderContainer container) {
    super.didUpdateProvider(provider, previousValue, newValue, container);
    logger.i('Provider updated: ${provider.name ?? provider.runtimeType}');
    logger.d('Previous value: $previousValue');
    logger.d('New value: $newValue');
  }

  @override
  void didDisposeProvider(ProviderBase provider, ProviderContainer container) {
    super.didDisposeProvider(provider, container);
    logger.i('Provider disposed: ${provider.name ?? provider.runtimeType}');
  }

  @override
  void providerDidFail(ProviderBase provider, Object error, StackTrace stackTrace, ProviderContainer container) {
    super.providerDidFail(provider, error, stackTrace, container);
    logger.e('Provider failed: ${provider.name ?? provider.runtimeType}');
    logger.e('Error: $error');
    logger.e('Stack trace: $stackTrace');
  }
}
