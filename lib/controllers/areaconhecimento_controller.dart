import 'dart:convert';
import 'package:direcionamento/model/nivel_academico_model.dart';
import 'package:direcionamento/provider/nivel_academico_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../model/areaconhecimento_model.dart';


class AreaConhecimentoController {

  NivelAcademicoProvider _nivelAcademicoProvider = NivelAcademicoProvider();

  String url = "http://192.168.128.2:3000/api/areaconhecimento/read";

  List<NivelAcademicoModel> nivel = [];
  late String idnivelacademico;
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


  void getNivel() async {
    nivel = await _nivelAcademicoProvider.getAll();
    //refresh();
  }




}