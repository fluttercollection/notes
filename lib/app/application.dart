import 'package:flutter/material.dart';
import 'package:notes/app/pages/note_one/note_one.dart';
import 'package:notes/app/pages/test.dart';

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: NoteOne(),
    );
  }
}
