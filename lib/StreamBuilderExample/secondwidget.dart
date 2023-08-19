import 'package:flutter/material.dart';

import 'stream_interface.dart';
import 'streammanager.dart';

class SecondWidget extends StatefulWidget {
  const SecondWidget({super.key});

  @override
  State<SecondWidget> createState() => _SecondWidgetState();
}

class _SecondWidgetState extends State<SecondWidget> {
  final StreamManagerInterface _streamManager = StreamManager();
  //created factory instace in manager so it will return same instance

  @override
  void dispose() {
    _streamManager.dispose();

    super.dispose();
  }

  @override
  void initState() {
    //work listen with streambuilder if it is broadcast else only one listen will be used
    _streamManager.getstream.listen((event) {
      debugPrint('listning $event');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: StreamBuilder<String>(
        stream: _streamManager.getstream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text('Stream Value: ${snapshot.data}');
          } else {
            return const Text('Stream is empty ');
          }
        },
      ),
    );
  }
}
