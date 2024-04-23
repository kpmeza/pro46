import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<List<posts>> Buscapost() async {
  var url = Uri.parse("https://jsonplaceholder.typicode.com/posts");

  final response = await http.get(url);

  return compute(pasaraListarusuario, response.body);
}

////////////// Pasar ListarUsuario
List<posts> pasaraListarusuario(String respuestaBody) {
  final pasar = json.decode(respuestaBody).cast<Map<String, dynamic>>();

  return pasar.map<posts>((json) => posts.fromJson(json)).toList();
}
////////////////

class posts {
  final userId;
  final id;
  final title;
  final body;

  posts({this.userId, this.id, this.title, this.body});

  factory posts.fromJson(Map<String, dynamic> json) {
    return posts(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}
