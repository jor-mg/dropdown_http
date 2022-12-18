import 'package:dropdown_http/models/especie_model.dart';
import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class EspecieService with ChangeNotifier {
  final String _baseUrl = 'gmlqcelelvidskpttktm.supabase.co';
  final Map<String, String> _headers = {
    'apiKey':
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImdtbHFjZWxlbHZpZHNrcHR0a3RtIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzEyMDc4NzksImV4cCI6MTk4Njc4Mzg3OX0.NMVaxzs5yYxn4HKslYG1Wy3fi2y_eZhnzkmPJXmg2Pk',
    'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImdtbHFjZWxlbHZpZHNrcHR0a3RtIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzEyMDc4NzksImV4cCI6MTk4Njc4Mzg3OX0.NMVaxzs5yYxn4HKslYG1Wy3fi2y_eZhnzkmPJXmg2Pk',
  };

  //Inicializar
  List<Especie> _listaEspecies = [];

  //Obtener
  List<Especie> get listaEspecies => _listaEspecies;

  EspecieService() {
    print('Provider EspecieService inicializado');
    getAllEspecies();
  }

  Future<String> _getJsonData(String endpoint) async {
    final url = Uri.https(
      _baseUrl,
      endpoint,
      {
        'select': '*',
      },
    );

    final response = await http.get(url, headers: _headers);

    return response.body;
  }

  getAllEspecies() async {
    final jsonData = await _getJsonData('rest/v1/especie');

    List<dynamic> listaDinamica = jsonDecode(jsonData);

    listaDinamica.forEach((element) {
      final Especie especie = Especie.fromMap(element);
      _listaEspecies.add(especie);
    });

    print('Petición HTTP Especies');
    notifyListeners();
  }
}
