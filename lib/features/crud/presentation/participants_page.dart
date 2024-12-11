import 'package:database_batch_3/config/sizes.dart';
import 'package:database_batch_3/features/crud/application/participant_generator.dart';
import 'package:database_batch_3/features/crud/data/database_repository.dart';
import 'package:database_batch_3/features/crud/domain/participant.dart';
import 'package:database_batch_3/features/crud/presentation/participants_data_view.dart';
import 'package:flutter/material.dart';

class ParticipantsPage extends StatefulWidget {
  final DatabaseRepository databaseRepository;

  const ParticipantsPage({
    super.key,
    required this.databaseRepository,
  });

  @override
  State<ParticipantsPage> createState() => _ParticipantsPageState();
}

class _ParticipantsPageState extends State<ParticipantsPage> {
  // Anfangs ist die Liste der Teilnehmer null
  List<Participant>? participants;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(Sizes.p16),
            child: Center(
              child: Column(
                children: [
                  ParticipantsDataView(participants: participants),
                  Sizes.gapH32,
                  ElevatedButton(
                    onPressed: () async {
                      await widget.databaseRepository.createParticipantList([]);
                    },
                    child: const Text("Create List"),
                  ),
                  Sizes.gapH16,
                  ElevatedButton(
                    onPressed: () async {
                      final List<Participant>? list =
                          await widget.databaseRepository.readParticipantList();
                      setState(() {
                        participants = list;
                      });
                    },
                    child: const Text("Read List"),
                  ),
                  Sizes.gapH16,
                  ElevatedButton(
                      onPressed: () async {
                        Participant participant = generateRandomParticipant();
                        await widget.databaseRepository
                            .updateParticipantList([participant]);
                      },
                      child: const Text("Update List")),
                  Sizes.gapH16,
                  ElevatedButton(
                    onPressed: () async {
                      await widget.databaseRepository.deleteParticipantList();
                    },
                    child: const Text("Delete List"),
                  ),
                  Sizes.gapH32,
                  const Text(
                    textAlign: TextAlign.center,
                    'Press "Read List" after each operation to see changes!',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
