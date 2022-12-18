// To parse this JSON data, do
//
//     final especie = especieFromMap(jsonString);

import 'dart:convert';

class Raza {
  int id;
  DateTime createdAt;
  String nombre;
  int especieId;
  Raza({
    required this.id,
    required this.createdAt,
    required this.nombre,
    required this.especieId,
  });

  factory Raza.fromJson(String str) => Raza.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Raza.fromMap(Map<String, dynamic> json) => Raza(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        nombre: json["nombre"],
        especieId: json["especie_id"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "created_at": createdAt.toIso8601String(),
        "nombre": nombre,
        "especie_id": especieId,
      };
}
