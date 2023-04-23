import 'dart:io';
import 'package:direcionamento/model/categories_model.dart';
import 'package:direcionamento/quiz_page/quiz_finished.dart';
import 'package:direcionamento/theme/global_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import '../model/Question.dart';




class QuizPage extends StatefulWidget {
  static final String path = "lib/src/pages/quiz_app/quiz_page.dart";
  final List<Question> questions;
  final CategoriesModel? categories;

  const QuizPage({Key? key, required this.questions, this.categories})
      : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final TextStyle _questionStyle = TextStyle(
      fontSize: 18.0, fontWeight: FontWeight.w500, color: Colors.white);

  late int _currentIndex = 0;
  late final Map<int, dynamic> _answers = {};
  late final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Question question = widget.questions[_currentIndex];
    final List<dynamic> options = question.incorrect_answers!;
    if (!options.contains(question.correctAnswer)) {
      options.add(question.correctAnswer);
      options.shuffle();
    }

    return WillPopScope(
      onWillPop: _onWillPop  as Future<bool> Function()?,
      child: Scaffold(
        key: _key,
        appBar: AppBar(
          backgroundColor: primary,
          title: Text(widget.categories!.name_categoria),
          elevation: 0,
        ),
        body: Stack(
          children: <Widget>[
            ClipPath(
              clipper: WaveClipperTwo(),
              child: Container(
                decoration: BoxDecoration(
                  color: primary,
                ),
                height: 200,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white70,
                        child: Text("${_currentIndex + 1}"),
                      ),
                      SizedBox(width: 16.0),
                      Expanded(
                        child: Text(
                          widget.questions[_currentIndex].question!,
                          softWrap: true,
                          style: _questionStyle,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ...options.map((option) => RadioListTile(
                          title: Text("$option"),
                          groupValue: _answers[_currentIndex]??"",
                          value: option!,
                          onChanged: (dynamic value) {
                            setState(() {
                              _answers[_currentIndex] = option;
                            });
                          },
                        )),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),

                        ),
                        child: Text(
                            _currentIndex == (widget.questions.length - 1)
                                ? "Enviar"
                                : "Avançar"),
                        onPressed: _nextSubmit,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _nextSubmit() {
    if (_answers[_currentIndex] == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Você deve selecionar uma resposta para continuar."),
      ));
      return;
    }
    if (_currentIndex < (widget.questions.length - 1)) {
      setState(() {
        _currentIndex++;
      });
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (_) => QuizFinishedPage(
              questions: widget.questions, answers: _answers)));
    }
  }



  Future<bool> _onWillPop() async {
    await showDialog<bool>(
        context: context,
        builder: (_) {
          return AlertDialog(
            content: Text(
                "Tem certeza de que deseja sair do questionário? Todo o seu progresso será perdido."),
            title: Text("Aviso!"),
            actions: <Widget>[
              TextButton(
                child: Text("Sim"),
                onPressed: () {
                  Navigator.pop(context, true);
                },
              ),
              TextButton(
                child: Text("Não"),
                onPressed: () {
                  Navigator.pop(context, false);
                },
              ),
            ],
          );

        });
    return true;
  }
}