import 'package:database_batch_3/features/crud/domain/participant.dart';

class MockDataSource {
  List<Participant>? _participantList;

  void create() {
    _participantList ??= [];
  }

  void clearList() => _participantList?.clear();
  void updateList(List<Participant> participants) {
    _participantList?.addAll(participants);
  }

  void deleteList() => _participantList = null;
  List<Participant>? getAll() => _participantList;
}
