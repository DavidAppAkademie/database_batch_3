import 'package:database_batch_3/features/crud/data/database_repository.dart';
import 'package:database_batch_3/features/crud/data/json/json_service.dart';
import 'package:database_batch_3/features/crud/domain/participant.dart';

class JsonRepository implements DatabaseRepository {
  final JsonService _jsonService;

  JsonRepository(this._jsonService);
  @override
  Future<void> createParticipantList(List<Participant> participants) {
    return _jsonService.createParticipantList(participants);
  }

  @override
  Future<void> deleteParticipantList() {
    return _jsonService.deleteParticipantList();
  }

  @override
  Future<List<Participant>?> readParticipantList() {
    return _jsonService.readParticipantList();
  }

  @override
  Future<bool> updateParticipantList(List<Participant> participants) {
    return _jsonService.updateParticipantList(participants);
  }
}
