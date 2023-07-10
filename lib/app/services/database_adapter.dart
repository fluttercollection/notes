import 'package:notes/app/models/note_model.dart';

abstract class DatabaseAdapter {
  Future<List<NoteModel>?> all();

  Future<bool> create({required NoteModel note});

  Future<NoteModel?> single({required int index});

  Future<NoteModel?> update(
      {String? title, String? body, required String currentTitle});

  Future<bool> delete({required int index});
}
