import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'stream_interface.dart';
import 'streammanager.dart';

class FirstWidget extends StatefulWidget {
  @override
  State<FirstWidget> createState() => _FirstWidgetState();
}

class _FirstWidgetState extends State<FirstWidget> {
  // final StreamManagerInterface _streamManager = StreamManager();

  @override
  Widget build(BuildContext context) {
    StreamManager manager = Provider.of<StreamManager>(context);

    return Center(
      child: ElevatedButton(
        onPressed: () {
          manager.addValue('first value added');
        },
        child: const Text('Add Value from FirstWidget'),
      ),
    );
  }
}
