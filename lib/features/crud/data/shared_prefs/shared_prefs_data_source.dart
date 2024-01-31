import 'dart:convert';

import 'package:database_batch_3/features/crud/domain/participant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsDataSource {
  static const String _key = "participants";
  //CRUD
  //Create
  Future<void> createParticipantList(List<Participant> participants) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setStringList(
        _key, participants.map((e) => jsonEncode(e.toJson())).toList());
  }

  //Read
  Future<List<Participant>?> readParticipantList() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final List<String>? jsonList = pref.getStringList(_key);

    return jsonList?.map((e) => Participant.fromJson(jsonDecode(e))).toList();
  }

  //Update
  Future<bool> updateParticipantList(List<Participant> participants) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final storedList = await readParticipantList();
    if (storedList == null) {
      return false;
    }
    List<Participant> newList = [...storedList, ...participants];
    return pref.setStringList(
        _key, newList.map((e) => jsonEncode(e.toJson())).toList());
  }

  //Delete
  Future<void> deleteParticipantList() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.remove(_key);
  }
}
