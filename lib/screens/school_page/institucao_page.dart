import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:direcionamento/controllers/categoria_controller.dart';
import 'package:direcionamento/controllers/instituicao_controller.dart';
import 'package:direcionamento/model/university.dart';
import 'package:direcionamento/screens/components/list_categoria.dart';
import 'package:direcionamento/screens/school_page/university_page.dart';
import 'package:direcionamento/theme/global_color.dart';
import 'package:direcionamento/widgets/custom_bottomNavigationBar.dart';
import 'package:direcionamento/widgets/custom_categories.dart';
import 'package:direcionamento/widgets/custom_notification.dart';
import 'package:direcionamento/widgets/custom_instituicao_item.dart';
import 'package:flutter/material.dart';

import '../../model/categories_model.dart';
import '../../model/instituicao_model.dart';
import '../../utils/data.dart';
import '../../widgets/bottomNavigationBar.dart';
import '../components/list_instituicao.dart';




class InstituicaoPage extends StatefulWidget {

  const InstituicaoPage({Key? key}) : super(key: key);

  @override
  State<InstituicaoPage> createState() => _InstituicaoPageState();
}

class _InstituicaoPageState extends State<InstituicaoPage> {



  Future<List<CategoriesModel>> ? futureCategoria;
  Future<List<InstituicaoModel>> ? futureInstituicao;


  @override
  void initState() {
    futureCategoria = fetchCategoria();
    futureInstituicao = fetchInstituicao();
    super.initState();

  }

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
      bottomNavigationBar: BootomNavigationBar(),
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
            getFeatureHigh(),
            SizedBox(height: 15,),
            Container(
              margin: EdgeInsets.fromLTRB(15, 0, 15, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Centros Profissionais", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600,color: textColor),),
                  //Text("Todos os cursos", style: TextStyle(fontSize: 14, color: darker),)
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
    return Container(
      child:  FutureBuilder(
        future: futureCategoria,
        builder: (context, snapshot){
          if(snapshot.hasData){
            final categoria = snapshot.data as List<CategoriesModel>;
            return ListCategoria(categoriamodel: categoria);
          } else if(snapshot.hasError){
            return Center(
              child: Text(
                snapshot.error.toString(),
                style: TextStyle(
                  fontSize: 16
                ),
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
   /* return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(15, 10, 0, 10),
      scrollDirection: Axis.horizontal,
      child: Row(
          children: List.generate(_listCategoriaDisplay.length, (index) =>
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: CustomCategories(
                  selectedColor: Colors.white,
                  data: _listCategoriaDisplay[index],
                  onTap: () {
                    setState((){
                      selectedColletion = index;
                    });
                  }, categoriesModel: _listCategoriaDisplay[index -1],
                ),
              )
          )
      ),
    );*/
  }




  getFeature(){
    return Container(
      child: FutureBuilder(
        future: futureInstituicao,
        builder: (context, snapshot){

          if(snapshot.hasData){
            final instituicao = snapshot.data as List<InstituicaoModel>;
            return ListInstituicao(instituicaoModel: instituicao);
          } else if(snapshot.hasError) {

            return Center(
              child: Text(
                snapshot.error.toString(),
                style: TextStyle(
                    fontSize: 16
                ),
              ),
            );
          }
          return const Center(
            child:  CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  getFeatureHigh(){
    return Container(
      child: FutureBuilder(
        future: futureInstituicao,
        builder: (context, snapshot){
          if(snapshot.hasData){
            final instituicao = snapshot.data as List<InstituicaoModel>;
            return ListInstituicao(instituicaoModel: instituicao);
          } else if(snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
                style: TextStyle(
                    fontSize: 16
                ),
              ),
            );
          }
          return const Center(
            child:  CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}


