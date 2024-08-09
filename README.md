# hbologger

`hbologger` is a Flutter package that provides a structured logging mechanism using the Chain of Responsibility pattern. It is designed to work seamlessly with Dio for network logging, Riverpod for provider state logging, and Flutter's navigation system.

## Features

- **Chain of Responsibility Pattern**: Log messages are handled through a chain, allowing for flexible and modular logging.
- **Dio Integration**: Log HTTP requests, responses, and errors in a structured manner.
- **Riverpod Integration**: Log provider lifecycle events, including creation, updates, disposals, and errors.
- **Navigator Integration**: Track and log navigation events in your Flutter app.
- **Customizable Log Levels**: Support for `DEBUG`, `INFO`, and `ERROR` log levels.

## Installation

Add `hbologger` to your `pubspec.yaml` file:

```yaml
dependencies:
  hbologger: ^0.0.1
```

## GUIDE
### Log Levels
The hbologger package supports three log levels:

- DEBUG: Logs detailed information typically useful for debugging.
- INFO: Logs general information about the app's operation.
- ERROR: Logs error messages, including stack traces, when things go wrong.


```dart
loggerChain.logMessage('This is a debug message', LogLevel.DEBUG);
loggerChain.logMessage('This is an info message', LogLevel.INFO);
loggerChain.logMessage('This is an error message', LogLevel.ERROR);
```
## Usage

### Setting Up the Chain of Responsibility
- The package provides multiple loggers (DebugLogger, InfoLogger, ErrorLogger) that are chained together to handle logging based on the severity of the log message.
```dart
import 'package:hbologger/src/loggers/debug_logger.dart';
import 'package:hbologger/src/loggers/info_logger.dart';
import 'package:hbologger/src/loggers/error_logger.dart';
import 'package:hbologger/src/log_level_enum.dart';
import 'package:hbologger/src/logger.dart';

void main() {
  final loggerChain = DebugLogger()
    ..setNextLogger(InfoLogger())
    ..setNextLogger(ErrorLogger());

  // Example log messages
  loggerChain.logMessage('This is a debug message', LogLevel.DEBUG);
  loggerChain.logMessage('This is an info message', LogLevel.INFO);
  loggerChain.logMessage('This is an error message', LogLevel.ERROR);
}
```
### DIO INTEGRATION
- To log HTTP requests, responses, and errors, use the HboLoggerInterceptor:
```dart
import 'package:dio/dio.dart';
import 'package:hbologger/hbologger_interceptor.dart';

void main() {
  final dio = Dio();

  // Add the HboLoggerInterceptor to Dio
  dio.interceptors.add(HboLoggerInterceptor());

  // Example request
  dio.get('https://jsonplaceholder.typicode.com/posts/1').then((response) {
    print(response.data);
  }).catchError((error) {
    print(error);
  });
}
```

### Riverpod Integration
- To log provider lifecycle events, use the LoggerObserver with Riverpod:
```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hbologger/logger_observer.dart';

void main() {
  runApp(
    ProviderScope(
      observers: [LoggerObserver()],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Riverpod Logger Example',
      home: MyHomePage(),
    );
  }
}

final exampleProvider = Provider((ref) => "Hello, World!");

class MyHomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final example = ref.watch(exampleProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Riverpod Logger Example'),
      ),
      body: Center(
        child: Text(example),
      ),
    );
  }
}
```
### NAVIGATOR INTEGRATION
- To log navigation events in your Flutter app, use the LoggingNavigatorObserver:
```dart
import 'package:flutter/material.dart';
import 'package:hbologger/logging_navigator_observer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      navigatorObservers: [LoggingNavigatorObserver()],
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Text('Navigate and observe logging in the console.'),
      ),
    );
  }
}
```

## Contributing
Contributions are welcome! If you find any issues or have suggestions for improvements, please open an issue or submit a pull request on [GitHub](https://github.com/hberkayozdemir/hbologger).