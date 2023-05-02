import 'dart:convert';
import 'dart:io';
import 'package:direcionamento/model/user_model.dart';
import 'package:direcionamento/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:path/path.dart';


class UserProvider {
  String api = "$baseUrl/api/auth";

  /*Future<UserModel> createUser(String name, String email, String password, String idnivelacademico) async {
    final response = await http.post(
      Uri.parse('$api/create'), headers: <String, String> {
      'Content-Type': 'application/json; charset=UTF-8',
    },
      body: jsonEncode( <String, String> {
        'nome': name,
        'email': email,
        'senha': password,
        'nivelacademico_idnivelacademico': idnivelacademico
      })
    );
    if (response.statusCode == 201) {
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create album.');
    }
  }*/

  Future<Stream?> create(UserModel usuario)  async {
    try {
      Uri url = Uri.parse("$api/create");
      final requeste = http.MultipartRequest('POST', url);
      requeste.headers[" 'Content-Type': 'application/json'"];

      requeste.fields['usuario'] = json.encode(usuario);

      final response = await requeste.send();
      return response.stream.transform(utf8.decoder);
    } catch(e) {
      print("Erro: $e");

      return null;
    }
  }
}

