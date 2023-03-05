import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:direcionamento/model/university.dart';
import 'package:direcionamento/screens/school_page/university_page.dart';
import 'package:direcionamento/theme/global_color.dart';
import 'package:direcionamento/widgets/custom_bottomNavigationBar.dart';
import 'package:direcionamento/widgets/custom_categories.dart';
import 'package:direcionamento/widgets/custom_notification.dart';
import 'package:direcionamento/widgets/custom_school_item.dart';
import 'package:flutter/material.dart';

import '../../utils/data.dart';




class SchoolPage extends StatefulWidget {
  const SchoolPage({Key? key}) : super(key: key);

  @override
  State<SchoolPage> createState() => _SchoolPageState();
}

class _SchoolPageState extends State<SchoolPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBarColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            //foregroundColor: black,
            automaticallyImplyLeading: false,
            backgroundColor: appBarColor,
            pinned: true,
            floating: true,
            title: getAppBar(),

          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) => builbody(),
                childCount: 1),
          )
        ],
      ),
      //bottomNavigationBar: CustomBootomNavigationBar(),
    );
  }

  Widget getAppBar() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Helmer Capassola",
                    style: TextStyle(color: labelColor, fontSize: 21),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Bom dia!",
                    style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 18),
                  )
                ],
              )),
          CustomNotification(
            notifiedNumber: 1,
            onTap: () {},
          )
        ],
      ),
    );
  }

  builbody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getCategories(),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 10, 15),
              child: Text(
                "Ensino Superior",
                style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 24),
              ),
            ),
            getFeature(),
            SizedBox(height: 15,),
            Padding(padding: EdgeInsets.fromLTRB(15, 0, 10, 15),
              child: Text("Ensino Médio", style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 24
              ),),
            ),
            getFeature(),
            SizedBox(height: 15,),
            Container(
              margin: EdgeInsets.fromLTRB(15, 0, 15, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Cursos", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600,color: textColor),),
                  Text("Todos os cursos", style: TextStyle(fontSize: 14, color: darker),)
                ],
              ),
            ),
            //getRecommend(),
          ],
        ),
      ),
    );
  }


  int selectedColletion = 0;
  getCategories() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(15, 10, 0, 10),
      scrollDirection: Axis.horizontal,
      child: Row(
          children: List.generate(categories.length, (index) =>
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: CustomCategories(
                  selectedColor: Colors.white,
                  data: categories[index],
                  onTap: () {
                    setState((){
                      selectedColletion = index;
                    });
                  },
                ),
              )
          )
      ),
    );
  }




  getFeature(){
    return CarouselSlider(
      options: CarouselOptions(
          height: 290,
          enlargeCenterPage: true,
          disableCenter: true,
          viewportFraction: .75
      ),
      items: List.generate(universty.length, (index){
        final item = universty[index];
        return CustomSchoolItem(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) =>UniversityPage(university: item,)));
          },
            name: item.name,
            image: item.image,
            location: item.location,
        );

      }),
    );
  }
}


