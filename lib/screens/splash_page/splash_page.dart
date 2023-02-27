import 'dart:io';
import 'package:direcionamento/screens/acess_page/login_page.dart';
import 'package:direcionamento/theme/global_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
 SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
 Future.delayed(Duration(seconds: 4)).then((_) {
   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage() ));
 });
  }

  @override
  Widget build(BuildContext context) {
    Size sizeDevice = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 80),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 250,),
                    Image.asset('assets/images/icons_1.png'),
                    SizedBox(height: 30,),
                    Center(
                      child: Text(
                        "Direcionamento Profissional", textAlign: TextAlign.center,
                        style: TextStyle(color: primary, fontSize: 30, fontWeight: FontWeight.bold),
                      ) ,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
    );
  }


}
