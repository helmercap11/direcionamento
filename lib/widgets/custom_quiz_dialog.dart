import 'dart:io';
import 'package:direcionamento/model/categories_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/annotations.dart';

import '../model/Question.dart';
import '../screens/quiz_page/quiz_page.dart';
import '../utils/data.dart';



class QuizOptionDialog extends StatefulWidget {

  final CategoriesModel  ? categories;

  const QuizOptionDialog({Key? key, this.categories}) : super(key: key);

  @override
  State<QuizOptionDialog> createState() => _QuizOptionDialogState();
}

class _QuizOptionDialogState extends State<QuizOptionDialog> {

  int? _noOfQuestion;
  String? _difficulty;
  late bool processing;

  void initState(){
    super.initState();
    _noOfQuestion=10;
    _difficulty ="easy";
    processing = false;
  }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding:const EdgeInsets.all(16.0),
            color: Colors.grey.shade200,
            child: Text(widget.categories!.name_categoria,style:
            Theme.of(context).textTheme.headline6?.copyWith(),),
          ),
          SizedBox(height: 10.0,),
          Text("Selecione o total de número de questões"),
          SizedBox(
            width: double.infinity,
            child: Wrap(
              alignment: WrapAlignment.center,
              runAlignment: WrapAlignment.center,
              runSpacing: 16.0,
              spacing: 16.0,
              children: [
                SizedBox(width: 0.0,),
                ActionChip(
                  label: Text("10"),
                  labelStyle: TextStyle( color: Colors.white),
                  backgroundColor: _noOfQuestion == 10
                      ?  Colors.indigo
                      : Colors.grey.shade600,
                  onPressed: () => _selectNumberQuestions(10),
                ),
                ActionChip(
                    label: Text("20"),
                    labelStyle: TextStyle(color: Colors.white),
                    backgroundColor: _noOfQuestion == 20
                        ? Colors.indigo
                        : Colors.grey.shade600,
                    onPressed: () => _selectNumberQuestions(20)
                ),
                ActionChip(
                    label: Text("30"),
                    labelStyle: TextStyle(color: Colors.white),
                    backgroundColor: _noOfQuestion ==30
                        ? Colors.indigo
                        : Colors.grey.shade600,
                    onPressed: () => _selectNumberQuestions(30)
                )
              ],
            ),
          ),
          SizedBox(height: 20.0,),
          Text("Selecione a dificuladade"),
          SizedBox(
            width: double.infinity,
            child: Wrap(
              alignment: WrapAlignment.center,
              runAlignment: WrapAlignment.center,
              runSpacing: 16.0,
              spacing: 16.0,
              children: [
                ActionChip(
                    label: Text("Qualquer"),
                    labelStyle: TextStyle(color: Colors.white),
                    backgroundColor: _difficulty == null
                        ? Colors.indigo
                        : Colors.grey.shade600,
                    onPressed: () => _selectDifficulty(null)
                ),
                ActionChip(
                    label: Text("Fácil"),
                    labelStyle: TextStyle(color: Colors.white),
                    backgroundColor: _difficulty == "easy"
                        ? Colors.indigo
                        : Colors.grey.shade600,
                    onPressed: ()  => _selectDifficulty("easy")
                ),
                ActionChip(
                    label: Text("Médio"),
                    labelStyle: TextStyle(color: Colors.white),
                    backgroundColor: _difficulty == "medium"
                        ? Colors.indigo
                        : Colors.grey.shade600,
                    onPressed: ()  => _selectDifficulty("medium")
                ),
                ActionChip(
                    label: Text("Difícil"),
                    labelStyle: TextStyle(color: Colors.white),
                    backgroundColor: _difficulty == "hard"
                        ? Colors.indigo
                        : Colors.grey.shade600,
                    onPressed: ()  => _selectDifficulty("hard")
                ),

              ],
            ),
          ),
          SizedBox(height: 20.0,),
          processing
              ? CircularProgressIndicator()
              :ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
            ),
            child: Text("Começar"),
            onPressed: _startQuiz,
          ),
          SizedBox(height: 20,),
        ],
      ),
    );
  }

  _selectNumberQuestions(int i) {
    setState((){
      _noOfQuestion = i;
    });
  }

  _selectDifficulty(String? s) {
    setState((){
      _difficulty = s;
    });
  }

  void _startQuiz() async {
    setState((){
      processing = true;
    });

    List<Question> questions = demoQuestions;
    Navigator.pop(context);
    Navigator.push(context,
        MaterialPageRoute(builder: (_) => QuizPage(
          questions: questions,
          categories: widget.categories,
        ) ));

    setState((){
      processing = false;
    });

  }
}
