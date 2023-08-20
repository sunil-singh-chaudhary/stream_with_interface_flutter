import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'streammanager.dart';

class SecondWidget extends StatefulWidget {
  const SecondWidget({super.key});

  @override
  State<SecondWidget> createState() => _SecondWidgetState();
}

class _SecondWidgetState extends State<SecondWidget> {
  // final StreamManagerInterface _streamManager = StreamManager();
  //created factory instace in manager so it will return same instance

  late StreamManager _manager;

  @override
  void dispose() {
    _manager.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _manager = Provider.of<StreamManager>(context, listen: false);

    //work listen with streambuilder if it is broadcast else only one listen will be used
    _manager.getstream.listen((event) {
      debugPrint('listning $event');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: StreamBuilder<String>(
        stream: _manager.getstream,
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
