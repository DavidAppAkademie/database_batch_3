import 'package:database_batch_3/features/crud/data/database_repository.dart';
import 'package:database_batch_3/features/crud/data/mock/mock_data_source.dart';
import 'package:database_batch_3/features/crud/domain/participant.dart';

class MockRepository implements DatabaseRepository {
  final MockDataSource _mockDataSource;
  MockRepository(this._mockDataSource);
  @override
  Future<void> createParticipantList(List<Participant> participants) async {
    _mockDataSource.create();
  }

  @override
  Future<void> deleteParticipantList() async {
    _mockDataSource.deleteList();
  }

  @override
  Future<List<Participant>?> readParticipantList() async {
    return _mockDataSource.getAll();
  }

  @override
  Future<bool> updateParticipantList(List<Participant> participants) async {
    _mockDataSource.updateList(participants);
    return true;
  }
}
