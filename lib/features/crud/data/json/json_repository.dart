import 'package:database_batch_3/features/crud/data/database_repository.dart';
import 'package:database_batch_3/features/crud/data/json/json_data_source.dart';
import 'package:database_batch_3/features/crud/domain/participant.dart';

class JsonRepository implements DatabaseRepository {
  final JsonDataSource _jsonDataSource;

  JsonRepository(this._jsonDataSource);
  @override
  Future<void> createParticipantList(List<Participant> participants) {
    return _jsonDataSource.createParticipantList(participants);
  }

  @override
  Future<void> deleteParticipantList() {
    return _jsonDataSource.deleteParticipantList();
  }

  @override
  Future<List<Participant>?> readParticipantList() {
    return _jsonDataSource.readParticipantList();
  }

  @override
  Future<bool> updateParticipantList(List<Participant> participants) {
    return _jsonDataSource.updateParticipantList(participants);
  }
}
