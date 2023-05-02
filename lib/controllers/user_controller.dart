import 'dart:convert';
import 'package:direcionamento/model/nivel_academico_model.dart';
import 'package:direcionamento/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:direcionamento/model/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../provider/nivel_academico_provider.dart';
import '../utils/mysnackbar.dart';
import '../utils/response_api.dart';

class UserController {


  late Function refresh;
  late BuildContext context;




  UserProvider userProvider = new UserProvider();
  NivelAcademicoProvider _nivelProvider = new NivelAcademicoProvider();


  List<NivelAcademicoModel> nivel = [];
  late String idnivelacademico;

  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController senhacontroller = TextEditingController();

  Future init(BuildContext context, Function refresh) async {
    this.context = context;
    this.refresh = refresh;
    getNivel();
  }

  void createUser() async {
    String name = namecontroller.text;
    String email = emailcontroller.text;
    String senha = senhacontroller.text;


    UserModel userModel = new UserModel(
        name: name,
        email: email,
        password: senha,
        idnivelacademico: int.parse(idnivelacademico));

   
    Stream? stream = await userProvider.create(userModel);

    stream?.listen((response) {
      ResponseApi responseApi = ResponseApi.fromJson(jsonDecode(response));

      MySnackbar.show(context, responseApi.message);
      if (responseApi.success) {
        reseValues();
      }
    });

  }


  void getNivel() async {
    nivel = await _nivelProvider.getAll();
    refresh();
  }
  /*void getNivel() async {
    nivel = (await _nivelProvider.getAll()).cast<Nivel>();
    refresh();
  }*/

  void reseValues() {
    idnivelacademico = '';
    refresh();
  }


}