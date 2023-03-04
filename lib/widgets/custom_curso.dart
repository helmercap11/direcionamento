import 'dart:io';
import 'package:direcionamento/screens/school_page/course_details.dart';
import 'package:direcionamento/screens/utils/data.dart';
import 'package:flutter/material.dart';



class CustomCurso extends StatelessWidget {


  const CustomCurso({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: courses.length,
        itemBuilder: (context, index) {
          final item = courses[index];
          return InkWell(
            onTap: (){
              //print("${item.idcurso}");
              //Navigator.of(context).push(MaterialPageRoute(builder: (context) => CursoDetails(id: item.idcurso) ));
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => CourseDetails(courses: item,) ));
            },
            child: Container(
              child: Container(
                height: 139,
                width: double.infinity,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.white70,
                          offset: Offset(1,1),
                          blurRadius: 4
                      )
                    ]
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /* Material(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                      color: Colors.blue,
                      child: Container(
                        padding: EdgeInsets.all(5.0),
                        child: Text("1",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0
                        ),),
                      ),
                    ),*/
                    SizedBox(width: 12.0,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${item.name}".toUpperCase(), style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0
                          ),),
                          SizedBox(height: 10.0,),
                          Text("${item.about}")
                        ],
                      ),
                    )
                  ],
                ),
                /*child: Card(
                  color: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(5.0))
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    child: Row(
                     children: [
                      Text("${item.name}")
                     ],
                    ),
                  ),
                ),*/
              ),
            ),
          );
        },
      ),
    );
  }
}
