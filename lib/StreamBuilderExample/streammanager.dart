import 'dart:async';

import 'package:flutter/cupertino.dart';

import 'stream_interface.dart';

class StreamManager implements StreamManagerInterface {
  static StreamManager instance = StreamManager._internal();
  factory StreamManager() {
    return instance;
  }
  StreamManager._internal();

  final StreamController<String> _streamController =
      StreamController<String>.broadcast();

  @override
  Stream<String> get getstream => _streamController.stream;
  @override
  void addValue(String value) {
    debugPrint('adding in stream $value');
    _streamController.add(value);
  }

  @override
  void dispose() {
    _streamController.close();
  }
}
