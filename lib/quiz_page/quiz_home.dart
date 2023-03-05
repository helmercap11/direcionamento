import 'dart:io';
import 'package:direcionamento/model/Categories.dart';
import 'package:direcionamento/theme/global_color.dart';
import 'package:direcionamento/widgets/custom_quiz_dialog.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import '../utils/data.dart';




class QuizHome extends StatelessWidget {
  const QuizHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        title: Text("Questões"),
        elevation: 0,
      ),
      body: Stack(
        children: [
          ClipPath(
            clipper: WaveClipperTwo() ,
            child: Container(
              decoration: BoxDecoration(
                  color: primary
              ),
              height: 200,
            ),
          ),
          CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Text("Selecione a Categoria", style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16.0
                  ),),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.all(16.0),
                sliver: SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.0,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0
                  ),
                  delegate: SliverChildBuilderDelegate(
                    _buidlCategoryItem,
                    childCount: categorie.length,
                  ),),
              )
            ],
          )
        ],
      ), backgroundColor: white70,
    );
  }

  Widget _buidlCategoryItem(BuildContext context, int index) {
    Categories categ = categorie [index];
    return MaterialButton(
      elevation: 1.0,
      highlightElevation: 1.0,
      onPressed: (){
        _categoryPressed(context, categ);
      },
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)
      ),
      color: Colors.white,
      textColor: black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if(categ.icon != null) Icon(categ.icon),
          if(categ.icon != null) SizedBox(height: 5.0,),
          Text(categ.name, textAlign: TextAlign.center,maxLines: 3,)
        ],
      ),
    );
  }


  _categoryPressed(BuildContext context, Categories categories) {
    showBottomSheet(
        context: context,
        builder: (sheetContext)  => BottomSheet(
          builder: (_)  => QuizOptionDialog(
            categories: categories,
          ),
          onClosing: () {},
        )
    );
  }

}
