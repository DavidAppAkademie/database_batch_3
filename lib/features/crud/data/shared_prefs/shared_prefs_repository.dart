import 'package:database_batch_3/features/crud/data/database_repository.dart';
import 'package:database_batch_3/features/crud/data/shared_prefs/shared_prefs_data_source.dart';
import 'package:database_batch_3/features/crud/domain/participant.dart';

export 'package:database_batch_3/features/crud/data/database_repository.dart';

class SharedPrefsRepository implements DatabaseRepository {
  final SharedPrefsDataSource _sharedPrefsDataSource;

  SharedPrefsRepository(this._sharedPrefsDataSource);

  @override
  Future<void> createParticipantList(List<Participant> participants) async {
    return _sharedPrefsDataSource.createParticipantList(participants);
  }

  @override
  Future<List<Participant>?> readParticipantList() async {
    return _sharedPrefsDataSource.readParticipantList();
  }

  @override
  Future<bool> updateParticipantList(List<Participant> participants) async {
    return _sharedPrefsDataSource.updateParticipantList(participants);
  }

  @override
  Future<void> deleteParticipantList() async {
    return _sharedPrefsDataSource.deleteParticipantList();
  }
}
