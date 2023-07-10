import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes/app/application.dart';
import 'package:notes/app/models/note_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox<NoteModel>('notes');
  Hive.registerAdapter(NoteModelAdapter());

  runApp(const Application());
}
