import 'package:flutter/material.dart';

import 'stream_interface.dart';
import 'streammanager.dart';

class FirstWidget extends StatelessWidget {
  final StreamManagerInterface _streamManager = StreamManager();

  FirstWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          _streamManager.addValue('Value from FirstWidget');
        },
        child: const Text('Add Value from FirstWidget'),
      ),
    );
  }
}
