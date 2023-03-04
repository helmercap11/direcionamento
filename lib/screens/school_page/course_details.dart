import 'dart:io';
import 'package:direcionamento/model/course.dart';
import 'package:flutter/material.dart';



class CourseDetails extends StatelessWidget {
  final Course courses;
  const CourseDetails({Key? key, required this.courses}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text(courses.name, style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.1,),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.only(left: 12.0, top: 15.0,right: 12.0),
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Regime de Avaliação", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                      SizedBox(
                        height: 10,
                      ),
                      Text(courses.regime,style: TextStyle(fontSize: 18, ),textAlign: TextAlign.justify),
                      SizedBox(height: 12.0,),
                      Text("Saida Profissional", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                      SizedBox(
                        height: 10,
                      ),
                      Text(courses.saida,style: TextStyle(fontSize: 18),textAlign: TextAlign.justify),
                      SizedBox(height: 10,),
                      Text("Diciplinas", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                      SizedBox(
                        height: 10,
                      ),
                      Text(courses.disc,style: TextStyle(fontSize: 18),),
                      SizedBox(height: 12.0,),
                      Container(
                        child: Row(
                          children: [
                            Expanded(child:  Text("Tempo de Duração:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),),
                            SizedBox(width: 50.0,),
                            Expanded(child: Text(courses.years,style: TextStyle(fontSize: 18),),)
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text("Custo", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                      SizedBox(
                        height: 10,
                      ),
                      Text(courses.name,style: TextStyle(fontSize: 18),),

                    ],
                  ),
                ),
              ],
            ),
          )
          /*Padding(
            padding: EdgeInsets.only(left: 12.0, top: 10),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Regime de Avaliação", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                      SizedBox(
                        height: 10,
                      ),
                      Text(cursos.regime,style: TextStyle(fontSize: 18),),
                      SizedBox(height: 12.0,),
                      Text("Saida Profissional", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                      SizedBox(
                        height: 10,
                      ),
                      Text(cursos.saida,style: TextStyle(fontSize: 18),),
                      Text("Regime de Avaliação", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                      SizedBox(
                        height: 10,
                      ),
                      Text(cursos.regime,style: TextStyle(fontSize: 18),),
                      SizedBox(height: 12.0,),
                      Text("Saida Profissional", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                      SizedBox(
                        height: 10,
                      ),
                      Text(cursos.saida,style: TextStyle(fontSize: 18),),
                      Text("Regime de Avaliação", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                      SizedBox(
                        height: 10,
                      ),
                      Text(cursos.regime,style: TextStyle(fontSize: 18),),
                      SizedBox(height: 12.0,),
                      Text("Saida Profissional", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                      SizedBox(
                        height: 10,
                      ),
                      Text(cursos.saida,style: TextStyle(fontSize: 18),),
                      Text("Regime de Avaliação", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                      SizedBox(
                        height: 10,
                      ),
                      Text(cursos.regime,style: TextStyle(fontSize: 18),),
                      SizedBox(height: 12.0,),
                      Text("Saida Profissional", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                      SizedBox(
                        height: 10,
                      ),
                      Text(cursos.saida,style: TextStyle(fontSize: 18),),
                    ],
                  ),
                ),
              ],
            ),
          ),*/


        ],
      ),
    );
  }
}