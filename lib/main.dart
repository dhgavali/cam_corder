import 'dart:html';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:qr_scanner/permissons.dart';
import 'package:qr_scanner/recorder.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late List<CameraDescription> _cameras;

  Future<List<CameraDescription>> getCamera() async {
    return await availableCameras();
  }

  @override
  void initState() {
    super.initState();
    getCamera().then((value) => _cameras = value);
    PerHandler().getCam();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
              child: const Text("Start recording"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => Recorder(cameras: _cameras)),
                  ),
                );
              })),
    );
  }
}
