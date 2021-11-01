import 'dart:async';
import 'dart:collection';

import 'log_message.dart';

class LogBloc {
  final List<LogMessage> _logs = [];
  final StreamController<List<LogMessage>> _logStreamController =
      StreamController<List<LogMessage>>();

  StreamSink<List<LogMessage>> get _inLogStream => _logStreamController.sink;
  Stream<List<LogMessage>> get outLogStream => _logStreamController.stream;

  void log(LogMessage logMessage) {
    _logs.add(logMessage);
    _inLogStream.add(UnmodifiableListView(_logs));
  }

  void dispose() => _logStreamController.close();
}
