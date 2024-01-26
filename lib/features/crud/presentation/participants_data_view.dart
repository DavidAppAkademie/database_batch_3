import 'package:database_batch_3/features/crud/domain/participant.dart';
import 'package:flutter/material.dart';

class ParticipantsDataView extends StatelessWidget {
  final List<Participant>? participants;
  const ParticipantsDataView({Key? key, required this.participants})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (participants == null) {
      return const Center(
        child: Text("Noch keine Daten vorhanden"),
      );
    } else {
      return ListView.builder(
          shrinkWrap: true,
          itemCount: participants!.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(participants![index].name),
              subtitle:
                  Text("Batch Number: ${participants![index].batchNumber}"),
            );
          });
    }
  }
}
