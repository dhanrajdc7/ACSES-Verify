// To parse this JSON data, do
//
//     final participant = participantFromJson(jsonString);

import 'dart:convert';

Participant participantFromJson(String str) => Participant.fromJson(json.decode(str));

String participantToJson(Participant data) => json.encode(data.toJson());

class Participant {
  Participant({
    required this.sr,
    required this.name,
    required this.email,
    required this.comp,
    required this.lab,
  });

  String sr;
  String name;
  String email;
  String comp;
  String lab;

  factory Participant.fromJson(Map<String, dynamic> json) => Participant(
    sr: json["sr"],
    name: json["name"],
    email: json["email"],
    comp: json["comp"],
    lab: json["lab"],
  );

  Map<String, dynamic> toJson() => {
    "sr": sr,
    "name": name,
    "email": email,
    "comp": comp,
    "lab": lab,
  };
}
