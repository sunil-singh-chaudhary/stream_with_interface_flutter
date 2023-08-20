// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stream_flutter_demo/StreamBuilderExample/stream_interface.dart';
import 'package:stream_flutter_demo/StreamBuilderExample/streammanager.dart';

import 'StreamBuilderExample/firstwidget.dart';
import 'StreamBuilderExample/secondwidget.dart';

void main() {
  runApp(MultiProvider(providers: [
    StreamManagerProvider(),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stream Example with Interface',
      home: Scaffold(
        appBar: AppBar(title: const Text('Stream with Interface')),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FirstWidget(),
            const SecondWidget(),
          ],
        ),
      ),
    );
  }
}
