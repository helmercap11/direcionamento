import 'dart:convert';
import 'dart:io';
import 'package:direcionamento/model/user_model.dart';
import 'package:direcionamento/utils/constant.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';


class UserProvider {
  String api = "$baseUrl/api/auth";

  Future<bool> Authentication( String email, String password) async {
    var url = Uri.parse('$api/authentication');
    var response = await http.post(url,
      body: {
        "email":email,
        "senha": password
      }
    );
    if(response == 200) {
      //print('Token' + jsonDecode(response.body)['token']);
      return true;
    }else {
      print(jsonDecode(response.body));
      return false;
    }
  }

  /*Future<bool> Authentication( String email, String password) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var body = {
      "email": email,
      "senha": password
    };
    var response = await http.post(
      Uri.parse('$api/authentication'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body),
    );
    if (response.statusCode == 201) {
      //
      print(jsonDecode(response.body)['token']);
      return true;
    } else {
      print(jsonDecode(response.body));
      return false;
      //throw Exception('Failed to  login.');
    }
  }*/

  Future<UserModel> createUser(String name, String email, String password, String idnivelacademico) async {
    final response = await http.post(
      Uri.parse('$api/create'), headers: <String, String> {
      'Content-Type': 'application/json; charset=UTF-8',
    },
      body: jsonEncode( <String, String> {
        'nome': name,
        'email': email,
        'senha': password,
       'idnivelacademico': idnivelacademico
      })
    );
    if (response.statusCode == 201) {
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create user.');
    }
  }

  List<UserModel> parseUserModel(String responseBody){
    var list = json.decode(responseBody) as List<dynamic>;
    var model = list.map((e) => UserModel.fromJson(e)).toList();
    return model;
  }


  Future<List<UserModel>> readUsers() async {
    final http.Response response = await http.get(Uri.parse('$api/users'));


    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return List<UserModel>.from(json.map((elemento) {
        return UserModelFromJson(elemento);
      }));
    } else {
      return Future.error("Ocorreu um erro.");
    }
  }



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

final userprovider = UserProvider();
