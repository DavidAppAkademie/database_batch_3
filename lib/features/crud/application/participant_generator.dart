import 'dart:math';

import 'package:database_batch_3/features/crud/domain/participant.dart';

Participant generateRandomParticipant() {
  Random random = Random();
  return Participant(
      name: "Participant ${random.nextInt(1000)}",
      batchNumber: random.nextInt(6));
}
