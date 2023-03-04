import 'dart:io';
import 'package:direcionamento/model/FieldStudyModel.dart';
import 'package:direcionamento/screens/field_Study_details/field_study_details.dart';
import 'package:direcionamento/screens/school_page/school_page.dart';
import 'package:direcionamento/screens/utils/data.dart';
import 'package:direcionamento/theme/global_color.dart';
import 'package:flutter/material.dart';

List<FieldStudyModel> fieldStudy = studyModel;

List<FieldStudyModel> selectedFieldStudy = [];


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {




  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Container(
        child: Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0),
          child: SafeArea(
            child: Container(
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  Container(
                    margin: EdgeInsets.all(9.0),
                    child:  Text(
                      "Escolha as áreas em que mais te destacas.",
                      style: TextStyle(
                          color: black,
                          fontSize: 20,
                          fontWeight: FontWeight.w400
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: studyModel.length,
                        itemBuilder: (BuildContext context, int index) {
                          final item = studyModel[index];
                        return Card(
                          margin: EdgeInsets.all(7.0),
                            elevation: 7.0,
                            child: FieldStudyItem(
                                studyModel[index].name,
                                studyModel[index].isSelected,
                                index
                            ),
                        );
                        }
                    ),
                  ),
            selectedFieldStudy.length > 0 ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10) ,
                    child: SizedBox(
                      width: double.infinity,
                      child: Container(
                        child: RaisedButton(
                            onPressed: (){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => SchoolPage()));
                            },
                          color: Colors.blue[700],
                          child: Text(
                            "Avançar(${selectedFieldStudy.length})",
                            style: TextStyle(
                              color: white,
                              fontSize: 18
                            ),
                          ),
                        ),
                      ),
                    ),
                  ):
                      Container(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


  Widget FieldStudyItem(String name, bool isSelected, int index){
    return ListTile(
        title: Text(
          name, style: TextStyle(
          color: black, fontWeight: FontWeight.w500,
            fontSize: 20
        ),
        ),
      trailing: isSelected
      ? Icon(Icons.check_circle, color: Colors.blue[700],)
      : Icon(Icons.check_circle_outline, color: Colors.grey ,),
      onTap: (){
          setState((){
            studyModel[index].isSelected = !studyModel[index].isSelected;
            if(studyModel[index].isSelected == true) {
              selectedFieldStudy.add(FieldStudyModel(name, true));
            } else if(studyModel[index].isSelected == false){
              selectedFieldStudy
                .removeWhere((element) => element.name == studyModel[index].name);
            }
          });
      },
    );
  }
}


