import 'dart:io';
import 'package:direcionamento/theme/global_color.dart';
import 'package:flutter/material.dart';

import '../model/Question.dart';
import 'check_answers.dart';



class QuizFinishedPage  extends StatelessWidget {
  final List<Question> questions;
  final Map<int , dynamic> answers;
  const QuizFinishedPage ({Key? key, required this.questions, required this.answers}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    int correct = 0;
    this.answers.forEach((index, value) {
      if(this.questions[index].correctAnswer == value) correct++;
    });
    final TextStyle titleStyle = TextStyle(
        color: Colors.black87, fontSize: 16.0, fontWeight: FontWeight.w500
    );
    final TextStyle trailingStyle= TextStyle(
        color: Theme.of(context).primaryColor,
        fontSize: 20.0,
        fontWeight: FontWeight.bold
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        title: Text("Resultado"),
        elevation: 0,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [primary, Colors.pink],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ListTile(
                  title: Text("Pontuação", style: titleStyle,),
                  trailing: Text("${correct / questions.length * 100}%",
                    style: trailingStyle,),
                ),
              ),
              SizedBox(height: 10.0,),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ListTile(
                  title: Text("Questões Correctas", style: titleStyle,),
                  trailing:  Text("$correct/${questions.length}", style: trailingStyle,),
                ),
              ),
              SizedBox(height: 10.0,),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)
                ),
                child: ListTile(
                  title: Text("Questão Incorrectas", style: titleStyle,),
                  trailing: Text("${questions.length - correct}/${questions.length}", style: trailingStyle,),
                ),
              ),
              SizedBox(height: 20.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)
                      ),

                    ),
                    child: Text("Voltar"),
                    onPressed: () => Navigator.pop(context),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)
                      ),
                    ),
                    child: Text("Verificar a Resposta"),
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => CheckAnswersPage(
                        questions: questions,
                        answers: answers,
                      ),));
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
