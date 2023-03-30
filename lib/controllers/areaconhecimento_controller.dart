import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../model/areaconhecimento_model.dart';


const String url = "http://127.0.0.1:5000/viewarea";

List<AreaConhecimentoModel> parseAreaConhecimento(String responseBody){
var list = json.decode(responseBody) as List<dynamic>;
var areas = list.map((e) => AreaConhecimentoModel.fromJson(e)).toList();
return areas;
}


Future<List<AreaConhecimentoModel>> fetchAreas() async {
  final http.Response response = await http.get(Uri.parse(url));

  if(response.statusCode ==200) {
    return compute(parseAreaConhecimento, response.body);
  } else {
    throw Exception(response.statusCode);
  }
}