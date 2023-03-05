import 'dart:io';
import 'package:direcionamento/screens/school_page/all_details.dart';

import 'package:flutter/material.dart';

import '../utils/data.dart';



class CustomAll extends StatelessWidget {
  const CustomAll({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 490,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: courses.length,
        itemBuilder: (context, index) {
          final item = courses[index];
          return InkWell(
            onTap: (){
              //print("${item.idcurso}");
              //Navigator.of(context).push(MaterialPageRoute(builder: (context) => CursoDetails(id: item.idcurso) ));
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => AllDetails(courses: item,) ));
            },
            child: Container(
              child: Container(
                height: 139,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xfff0f0f0)
                ),
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
                    Container(
                      width: 100,
                      height: double.infinity,
                      margin: EdgeInsets.only(right: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(width: 3, color: Colors.grey),
                          image: DecorationImage(
                              alignment: Alignment.bottomCenter,
                              image: NetworkImage("${item.image}"), fit: BoxFit.fill
                          )
                      ),
                    ),
                    //SizedBox(width: 12.0,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${item.name}".toUpperCase(), style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0
                          ),),
                          SizedBox(height: 10.0,),
                          Text("${item.years}")
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
