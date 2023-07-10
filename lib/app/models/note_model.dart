import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'note_model.g.dart';

@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String body;
  @HiveField(2)
  final Color? color;

  NoteModel({required this.title, required this.body, this.color});

  NoteModel copyWith({String? newTitle, String? newBody}) {
    return NoteModel(title: newTitle ?? title, body: newBody ?? body);
  }

  @override
  String toString() => title;
}
