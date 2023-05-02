import 'dart:io';
import 'package:direcionamento/screens/acess_page/register_page.dart';
import 'package:direcionamento/screens/acess_page/resgister.dart';
import 'package:direcionamento/screens/home_page/home_page.dart';
import 'package:direcionamento/theme/global_color.dart';
import 'package:flutter/material.dart';

import '../school_page/institucao_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  void _homepage() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => InstituicaoPage(),
        ));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Theme(
        data: Theme.of(context).copyWith(
          inputDecorationTheme: InputDecorationTheme(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
        ),
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [white, white])),
              child: Column(
                children: [
                  Align(
                    child: logo(),
                  )
                ],
              ),
            ),
            Padding(
              child: Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(0.0)),
                  child: Container(
                    child: ListView(
                      children: [
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 10, top: 0),
                                child: Text(
                                  "Iniciar Sessão",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: black,
                                      fontWeight: FontWeight.w900),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    bottom: 10, top: 20, left: 20, right: 20),
                                child: TextFormField(
                                  autocorrect: false,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: (value) {
                                    return value!.contains('')
                                        ? 'Validação que retorna falsa no valor inicial.'
                                        : null;
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                      labelText: 'E-mail',
                                      prefixIcon: Icon(Icons.email)),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    bottom: 20, left: 20, top: 20, right: 20),
                                child: TextFormField(
                                  autocorrect: false,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: (value) {
                                    if (value == null || value.isNotEmpty) {
                                      return 'campo obrigátorio';
                                    }
                                  },
                                  decoration: InputDecoration(
                                      labelText: 'Palavra Passe',
                                      prefixIcon: Icon(Icons.lock)),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 32),
                                  child: FlatButton(
                                    child: Text(
                                      "Esqueceu a palavra passe ?",
                                      style: TextStyle(
                                          color: black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 20,
                                    right: 20,
                                    bottom: MediaQuery.of(context)
                                        .viewInsets
                                        .bottom),
                                child: Container(
                                  child: _button("Entrar", white, primary,
                                      primary, white, _homepage),
                                  height: 50,
                                  width: MediaQuery.of(context).size.width,
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              FlatButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              RegisterUser()));
                                },
                                child: Text(
                                  "Criar Conta",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: black,
                                      fontWeight: FontWeight.w700),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    color: white,
                  ),
                ),
              ),
              padding: EdgeInsets.only(top: 230),
            )
          ],
        ),
      ),
    );
  }

  // widget log
  Widget logo() {
    Size sizeDevice = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 95),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: sizeDevice.height / 10,
              ),
              Image(image: new AssetImage('assets/images/icons_1.png')),
              Text(
                "Orientação Profissional",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20, color: primary, fontWeight: FontWeight.w900),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _button(String text, Color splashColor, Color highligthColor,
      Color fillColor, Color textColor, void function()) {
    return RaisedButton(
      onPressed: () {
        function();
      },
      highlightElevation: 0.0,
      splashColor: splashColor,
      elevation: 0.0,
      color: fillColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      child: Text(
        text,
        style: TextStyle(
            color: textColor, fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }
}
