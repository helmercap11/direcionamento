import 'dart:io';
import 'package:direcionamento/model/areaconhecimento_model.dart';
import 'package:direcionamento/model/course.dart';
import 'package:direcionamento/theme/global_color.dart';
import 'package:flutter/material.dart';



class AreaDetailsPage extends StatefulWidget {
  final AreaConhecimentoModel areaConhecimentoModel;
  final Course  ? course;
  const AreaDetailsPage({Key? key,required this.areaConhecimentoModel, this.course}) : super(key: key);

  @override
  State<AreaDetailsPage> createState() => _AreaDetailsPageState();
}

class _AreaDetailsPageState extends State<AreaDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        title: Text("Instituição de Ensino"),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 16.0,
            ),
            Text(
              widget.areaConhecimentoModel.name,
              style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w700
              ),
              textAlign: TextAlign.left,
            ),
            Text(widget.areaConhecimentoModel!.name)
          ],
        ),
      ),
    );
  }
}

/*class AreaDetailsPage extends StatelessWidget {
  final AreaConhecimentoModel areaConhecimentoModel;
   final Course  ? course;
  const AreaDetailsPage({Key? key, required this.areaConhecimentoModel, this.course}) : super(key: key);

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
            ),
            Text(course!.name)
          ],
        ),
      ),
    );
  }
}*/
