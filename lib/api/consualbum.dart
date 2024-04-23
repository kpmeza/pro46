import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<List<fotos>> Buscalbum() async {
  var url = Uri.parse("https://jsonplaceholder.typicode.com/albums");

  final response = await http.get(url);

  return compute(pasaraListarusuario, response.body);
}

////////////// Pasar ListarUsuario
List<fotos> pasaraListarusuario(String respuestaBody) {
  final pasar = json.decode(respuestaBody).cast<Map<String, dynamic>>();

  return pasar.map<fotos>((json) => fotos.fromJson(json)).toList();
}
////////////////

class fotos {
  final userId;
  final id;
  final title;

  fotos({this.userId, this.id, this.title});

  factory fotos.fromJson(Map<String, dynamic> json) {
    return fotos(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}
