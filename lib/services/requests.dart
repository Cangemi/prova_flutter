import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:prova_flutter/models/usuario.dart';

class userRequests {
  String urlBase = "https://65617b88dcd355c08323daa4.mockapi.io/api/users";

   Future<List> getUser() async {
    http.Response response = await http.get(Uri.parse(urlBase));

    if (response.statusCode == 200) {
      var dadosJson = json.decode(response.body);
      return dadosJson.map((json) => Users.fromJson(json)).toList();
    } else {
      throw Exception('Erro não foi possivel carregar usuarios');
    }
  }
}


