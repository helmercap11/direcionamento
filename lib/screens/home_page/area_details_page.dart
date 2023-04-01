import 'dart:io';
import 'package:direcionamento/model/areaconhecimento_model.dart';
import 'package:flutter/material.dart';


class AreaDetailsPage extends StatelessWidget {
  final AreaConhecimentoModel areaConhecimentoModel;
  const AreaDetailsPage({Key? key, required this.areaConhecimentoModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Area de Conhecimento"),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 16.0,
            ),
            Text(
              areaConhecimentoModel.name,
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.w700
              ),
              textAlign: TextAlign.left,
            )
          ],
        ),
      ),
    );
  }
}
