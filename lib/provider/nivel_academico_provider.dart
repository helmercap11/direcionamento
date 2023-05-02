import 'dart:convert';
import 'package:direcionamento/model/nivel_academico_model.dart';
import 'package:direcionamento/utils/constant.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';




class NivelAcademicoProvider {
  String api = "$baseUrl/api/nivelacademico";



  Future<List<NivelAcademicoModel>> getAll() async {
    try {
      Uri url = Uri.parse("$api/read");

      Map<String, String> headers = {
        'Content-Type': 'application/json',
      };

      final response = await http.get(url, headers: headers);

      final data = jsonDecode(response.body);
      NivelAcademicoModel nivel = NivelAcademicoModel.fromJsonList(data);

      return nivel.toList;
    }catch(e){
      print("Error: $e");
      return [];
    }
  }
}