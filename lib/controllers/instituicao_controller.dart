import 'dart:convert';
import 'package:direcionamento/model/instituicao_model.dart';
import 'package:http/http.dart' as http;


const String url = "http://192.168.128.2:3000/api/instituicao/read";


Future<List<InstituicaoModel>> fetchInstituicao() async {
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final json = jsonDecode(response.body);
    return List<InstituicaoModel>.from(json.map((elemento) {
      return InstituicaoModel.fromJson(elemento);
    }));
  } else {
    return Future.error("Ocorreu um erro.");
  }
}