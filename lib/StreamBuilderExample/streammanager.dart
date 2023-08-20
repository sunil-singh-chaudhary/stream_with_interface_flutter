import 'dart:async';

import 'package:flutter/cupertino.dart';

import 'stream_interface.dart';
import 'package:provider/provider.dart';

class StreamManager implements StreamManagerInterface {
  // [FIRST METHOD] for getting sme instance all over app

  // static StreamManager instance = StreamManager._internal();
  // factory StreamManager() {
  //   return instance;
  // }
  // StreamManager._internal();

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
// [SECOND METHOD] for sharing same Instance allover app we can use provider
//same approch also used in getIt for sharing instance but if i use provider why not use
//it full capacity

class StreamManagerProvider extends Provider<StreamManager> {
  StreamManagerProvider({super.key}) : super(create: (_) => StreamManager());
}
