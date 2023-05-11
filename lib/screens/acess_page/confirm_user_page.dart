import 'package:direcionamento/quiz_page/quiz_home.dart';
import 'package:flutter/material.dart';

import '../../theme/global_color.dart';
import '../home_page/home_page.dart';




class ConfirmUser extends StatefulWidget {
  const ConfirmUser({Key? key}) : super(key: key);

  @override
  State<ConfirmUser> createState() => _ConfirmUserState();
}

class _ConfirmUserState extends State<ConfirmUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Confirmação de Conta"),
        automaticallyImplyLeading: false,
      ),
      body: Theme( data: Theme.of(context).copyWith(
        inputDecorationTheme: InputDecorationTheme(
            border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(20)))),
          child: Container(
            color: white,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  Padding(
                    padding: EdgeInsets.only(
                         left: 40, right: 40),
                    child: Column(
                      children: [
                        Text(
                          "Insira o código que foi enviado no seu email: ",
                          style: TextStyle(fontSize: 20, color: black, decoration: TextDecoration.none),
                        ),
                        SizedBox(height: 20,),
                        TextFormField(
                          autocorrect: false,
                          autovalidateMode:
                          AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            return value!.contains('')
                                ? 'Validação que retorna falsa no valor inicial.'
                                : null;
                          },
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              labelText: 'codigo de confirmação',
                              prefixIcon: Icon(Icons.lock)),
                        ),
                      ],
                    )
                  ),

                  SizedBox(height: 40,),
                  Padding(padding: EdgeInsets.only(top: 60),
                      child:  ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: blue,
                            onPrimary: Colors.white,
                            shadowColor: blue,
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32.0)),
                            minimumSize: Size(300, 50), //////// HERE
                          ),
                          child: Text(
                            'Confirmar',
                            style: TextStyle(fontSize: 20,),
                          ),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => WellCome()));
                          }
                      )

                  ),
                ],
              ),
            ),
          )
      ),
    );
  }
}


class WellCome extends StatefulWidget {
  const WellCome({Key? key}) : super(key: key);

  @override
  State<WellCome> createState() => _WellComeState();
}

class _WellComeState extends State<WellCome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),

              child: Center(child: Icon(Icons.check_circle_outline_sharp, size: 200,color: blue,)),
            ),
            SizedBox(height: 10,),
            Text(
              "Bem Vindo.",
              style: TextStyle(fontSize: 30, color: black, decoration: TextDecoration.none),
            ),
            SizedBox(height: 15,),
            Text(
              "Estamos aqui para ajudar na sua Orientação Profissional! A seguir será apresentado algumas áreas de conhecimento.",
              style: TextStyle(fontSize: 20, color: Colors.black38, decoration: TextDecoration.none),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 40,),
            Padding(padding: EdgeInsets.only(top: 60),
                child:  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: blue,
                      onPrimary: Colors.white,
                      shadowColor: blue,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                      minimumSize: Size(300, 50), //////// HERE
                    ),
                    child: Text(
                      'Continuar',
                      style: TextStyle(fontSize: 20,),
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                    }
                )

            ),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> QuizHome()));
            }, child: Text("text")),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
            }, child: Text("text")),

          ],
        ),
      ),
    );
  }
}