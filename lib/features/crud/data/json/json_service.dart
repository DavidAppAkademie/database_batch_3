import 'dart:convert';
import 'dart:io';

import 'package:database_batch_3/features/crud/domain/participant.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:path/path.dart' as path;

class JsonService {
  static const String _fileName = "participants.json";
  //CRUD
  //Create
  Future<File> getFile() async {
    final dir = await path_provider.getApplicationDocumentsDirectory();
    return File(path.join(dir.path, _fileName));
  }

  Future<File> createParticipantList(List<Participant> participants) async {
    final String jsonString =
        jsonEncode(participants.map((e) => e.toJson()).toList());
    final File file = await getFile();
    return file.writeAsString(jsonString);
  }

  //Read
  Future<List<Participant>> readParticipantList() async {
    try {
      final File file = await getFile();
      final String jsonString = await file.readAsString();
      final List<dynamic> jsonList = jsonDecode(jsonString);
      return jsonList.map((e) => Participant.fromJson(e)).toList();
    } catch (e) {
      return [];
    }
  }

  //Update
  Future<bool> updateParticipantList(List<Participant> participants) async {
    try {
      final File file = await getFile();
      final storedList = await readParticipantList();
      List<Participant> newList = [...storedList, ...participants];
      final String jsonString =
          jsonEncode(newList.map((e) => e.toJson()).toList());

      await file.writeAsString(jsonString);
      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  //Delete
  Future<void> deleteParticipantList() async {
    final File file = await getFile();
    await file.delete();
  }
}
