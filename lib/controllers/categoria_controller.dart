import 'dart:convert';
import 'package:direcionamento/model/categories_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;



const String url = "http://192.168.128.2:8000/api/categoria/read";

Future<List<CategoriesModel>> fetchCategoria() async{
  final response = await http.get(Uri.parse(url));

  if(response.statusCode == 200){
    final json = jsonDecode(response.body);
    return List<CategoriesModel>.from(json.map((elemento) {
      return CategoriesModel.fromJson(elemento);
    }));
} else{
    return Future.error("Ocorreu um erro.");
  }

/*List<CategoriesModel> parseCategoria(String responseBody){
  var list = json.decode(responseBody) as List<dynamic>;
  var categories = list.map((e) => CategoriesModel.fromJson(e)).toList();
  return categories;
}

Future<List<CategoriesModel>> fetchCategoria() async {
  final http.Response response = await http.get(Uri.parse(url));

  if(response.statusCode == 200) {
    return compute(parseCategoria, response.body);
  }else {
    throw Exception(response.statusCode);
  }*/
}

