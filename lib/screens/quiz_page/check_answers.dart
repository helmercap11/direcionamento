import 'dart:io';
import 'package:direcionamento/screens/quiz_page/quiz_home.dart';
import 'package:direcionamento/screens/root_app/root_app.dart';
import 'package:direcionamento/theme/global_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import '../../model/Question.dart';





class CheckAnswersPage  extends StatelessWidget {
  final List<Question> questions;
  final Map<int, dynamic> answers;
  const CheckAnswersPage ({Key? key, required this.questions, required this.answers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        title: Text("Verificar Respostar"),
        elevation: 0,
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton.extended(
            heroTag: null, foregroundColor: primary,
            //onPressed: formBloc.submit,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) =>RootApp()));
            },
            icon: Icon(Icons.gpp_good, color: white,),
            label: Text('Concluir',style: TextStyle(color: white, fontWeight: FontWeight.bold, fontSize: 16),),
          )
        ],
      ),
      body: Stack(
        children: [
          ClipPath(
            clipper: WaveClipperTwo(),
            child: Container(
              decoration: BoxDecoration(color: primary),
              height: 200,
            ),
          ),
          ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: questions.length,
              itemBuilder: _buildItem
          )
        ],
      ),
    );
  }

  Widget _buildItem(BuildContext context, int index){
    if(index == questions.length) {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        ),
        child: Text("Feito"),
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => QuizHome(),));
        },
      );
    }

    Question question = questions[index];
    bool correct = question.correctAnswer ==answers [index];
    return Card(
      child: Padding(
        padding:const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              question.question!, style: TextStyle(
                color:  Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 16.0
            ),
            ),
            SizedBox(height: 5.0,),
            Text(
              "${answers[index]}", style: TextStyle(
                color: correct ? Colors.green : Colors.red,
                fontSize: 18.0,
                fontWeight: FontWeight.bold
            ),
            ),
            SizedBox(height: 5.0,),
            correct
                ? Container()
                : Text.rich(
              TextSpan(
                  children: [
                    TextSpan(text: "Resposta:"),
                    TextSpan(
                        text: question.correctAnswer,
                        style: TextStyle(fontWeight: FontWeight.w500)
                    )
                  ]
              ),
              style: TextStyle(fontSize: 16.0),
            )
          ],
        ),
      ),
    );
  }
}
