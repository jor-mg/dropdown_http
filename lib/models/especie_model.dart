import 'dart:convert';

class Especie {
  int id;
  DateTime createdAt;
  String nombre;

  Especie({
    required this.id,
    required this.createdAt,
    required this.nombre,
  });

  factory Especie.fromJson(String str) => Especie.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Especie.fromMap(Map<String, dynamic> json) => Especie(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        nombre: json["nombre"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "created_at": createdAt.toIso8601String(),
        "nombre": nombre,
      };
}
