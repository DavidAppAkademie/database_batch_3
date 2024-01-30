import 'package:database_batch_3/features/crud/data/database_repository.dart';
import 'package:database_batch_3/features/crud/data/mock/mock_service.dart';
import 'package:database_batch_3/features/crud/domain/participant.dart';

class MockRepository implements DatabaseRepository {
  final MockService _mockService;
  MockRepository(this._mockService);
  @override
  Future<void> createParticipantList(List<Participant> participants) async {
    await Future.delayed(const Duration(seconds: 2));
    _mockService.create();
  }

  @override
  Future<void> deleteParticipantList() async {
    await Future.delayed(const Duration(seconds: 2));
    _mockService.deleteList();
  }

  @override
  Future<List<Participant>?> readParticipantList() async {
    await Future.delayed(const Duration(seconds: 2));
    return _mockService.getAll();
  }

  @override
  Future<bool> updateParticipantList(List<Participant> participants) async {
    await Future.delayed(const Duration(seconds: 2));
    _mockService.updateList(participants);
    return true;
  }
}
