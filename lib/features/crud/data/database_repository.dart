import 'package:database_batch_3/features/crud/domain/participant.dart';

abstract class DatabaseRepository {
  Future<void> createParticipantList(List<Participant> participants);
  Future<List<Participant>?> readParticipantList();
  Future<bool> updateParticipantList(List<Participant> participants);
  Future<void> deleteParticipantList();
}
