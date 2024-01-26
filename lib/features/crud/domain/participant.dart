class Participant {
  final String name;
  final int batchNumber;

  Participant({
    required this.name,
    required this.batchNumber,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "batchNumber": batchNumber,
    };
  }

  factory Participant.fromJson(Map<String, dynamic> json) {
    return Participant(
      name: json["name"],
      batchNumber: json["batchNumber"],
    );
  }
}
