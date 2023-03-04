import 'dart:io';
import 'package:direcionamento/model/course.dart';
import 'package:flutter/material.dart';



class AllDetails extends StatelessWidget {
  final Course courses;
  const AllDetails({Key? key, required this.courses}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title:  Text(courses.name, style: TextStyle(color: Colors.black),),
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Column(
                  children: [
                    Image.network(
                        courses.image,
                        width: double.infinity,
                        height: 250,
                        fit: BoxFit.cover),
                    Positioned(
                      // The Positioned widget is used to position the text inside the Stack widget
                      bottom: 10,
                      right: 10,

                      child: Container(
                        // We use this Container to create a black box that wraps the white text so that the user can read the text even when the image is white
                        width: 300,
                        color: Colors.black54,
                        padding: const EdgeInsets.all(15),
                        child:  Text(
                          courses.name,
                          style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                )
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 15, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(courses.about),
                    SizedBox(height: 12.0,),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text("Data:"),
                          ),
                          SizedBox(width: 100,),
                          Expanded(child: Text(courses.years))
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            )

          ],

        ));
  }
}
