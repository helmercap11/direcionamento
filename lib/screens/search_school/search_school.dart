import 'dart:io';
import 'package:direcionamento/theme/global_color.dart';
import 'package:direcionamento/widgets/custom_bottomNavigationBar.dart';
import 'package:flutter/material.dart';

import '../../utils/data.dart';



class SearchSchool extends StatefulWidget {
  const SearchSchool({Key? key}) : super(key: key);

  @override
  State<SearchSchool> createState() => _SearchSchoolState();
}

class _SearchSchoolState extends State<SearchSchool> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfff0f0f0), elevation: 0.1,foregroundColor: black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //const Text("Flutter "),
            const SizedBox(
              width: 0,
            ), // SizedBox
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFFFFFFFF),
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 15.0),
                  /* -- Text and Icon -- */
                  hintText: "Pesquisar",
                  hintStyle: const TextStyle(
                    fontSize: 18,
                    color: Color(0xFFB3B1B1),
                  ), // TextStyle
                  suffixIcon: const Icon(
                    Icons.search,
                    size: 26,
                    color: Colors.black54,
                  ), // Icon
                  /* -- Border Styling -- */
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(45.0),
                    borderSide: const BorderSide(
                      width: 2.0,
                      color: Color(0xFFFF0000),
                    ), // BorderSide
                  ), // OutlineInputBorder
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(45.0),
                    borderSide: const BorderSide(
                      width: 2.0,
                      color: Colors.grey,
                    ), // BorderSide
                  ), // OutlineInputBorder
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(45.0),
                    borderSide: const BorderSide(
                      width: 2.0,
                      color: Colors.grey,
                    ), // BorderSide
                  ), // OutlineInputBorder
                ), // InputDecoration
              ), // TextField
            ), // Expanded
          ],
        ), // Row
      ),
      backgroundColor:  Color(0xfff0f0f0),
      body: Container(
        height: double.infinity,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.only(top: 10,bottom: 83),
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                child: ListView.builder(
                    itemCount: courses.length,
                    itemBuilder: (context, int index){
                      final item = courses[index];
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white,
                        ),
                        height: 110,
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 100,
                              height: double.infinity,
                              margin: EdgeInsets.only(right: 15),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(width: 3, color: Colors.grey),
                                  image: DecorationImage(
                                      alignment: Alignment.bottomCenter,
                                      image: NetworkImage("${item.image}"),fit: BoxFit.fill
                                  )
                              ),
                            ),
                            Expanded(
                                child:Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("${item.name}",style:
                                    TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold
                                    ),),
                                    SizedBox(height: 6,),
                                    Row(
                                      children: [
                                        Icon(Icons.location_on,
                                          color: black,
                                          size: 18,),
                                        SizedBox(width: 5,),
                                        Text("${item.price}", style: TextStyle(
                                            color: blue,
                                            fontSize: 13,
                                            letterSpacing: .3
                                        ),)
                                      ],
                                    ),
                                    SizedBox(height: 6,),
                                    Row(
                                      children: [
                                        Icon(Icons.school,
                                          color: black,
                                          size: 20,),
                                        SizedBox(width: 5,),
                                        Text("${item.years}",style:
                                        TextStyle(
                                            color: blue, fontSize: 13, letterSpacing: 3
                                        ),)
                                      ],
                                    )
                                  ],
                                )
                            )
                          ],
                        ),
                      );
                    }
                ),
              ),
              // Top
              /*Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 110,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        child: TextField(
                          cursorColor: Theme.of(context).primaryColor,
                          //style: dropD,
                          decoration: InputDecoration(
                            hintText: "Pesquisar",
                            hintStyle: TextStyle(
                              color: Colors.black38,
                              fontSize: 16
                            ),
                            prefixIcon: Material(
                              elevation: 0.0,
                              borderRadius: BorderRadius.all(Radius.circular(30)),
                              child: Icon(Icons.search),
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 13
                            )
                          ),
                        ),
                      ),
                    )
                  ],
                ) ,
              )*/
            ],
          ),
        ),
      ),
    );
  }
}


