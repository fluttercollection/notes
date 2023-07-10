import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes/app/models/note_model.dart';
import 'package:notes/app/services/database_adapter.dart';

class HiveDatabase implements DatabaseAdapter {
  HiveDatabase._();
  static final HiveDatabase _shared = HiveDatabase._();
  factory HiveDatabase.instance() => _shared;
  static const String _noteBoxName = 'notes';

  @override
  Future<List<NoteModel>?> all() async {
    try {
      return Hive.box<NoteModel>(_noteBoxName).values.toList();
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  @override
  Future<bool> create({required NoteModel note}) async {
    try {
      await Hive.box(_noteBoxName).add(note);
      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  @override
  Future<bool> delete({required int index}) async {
    try {
      await Hive.box(_noteBoxName).deleteAt(index);
      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  @override
  Future<NoteModel?> single({required int index}) async {
    try {
      final note = Hive.box(_noteBoxName).getAt(index);
      return note;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  @override
  Future<NoteModel?> update(
      {String? title, String? body, required String currentTitle}) async {
    try {
      final currentNote = Hive.box<NoteModel>(_noteBoxName)
          .values
          .firstWhere((NoteModel element) => element.title == currentTitle);

      final index = Hive.box(_noteBoxName).values.toList().indexOf(currentNote);

      final updatedNote = currentNote.copyWith(newTitle: title, newBody: body);

      await Hive.box(_noteBoxName).putAt(index, updatedNote);
      return updatedNote;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
