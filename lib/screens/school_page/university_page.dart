import 'dart:io';
import 'package:direcionamento/model/university.dart';
import 'package:direcionamento/screens/tabs/university/all_tab.dart';
import 'package:direcionamento/screens/tabs/university/mestrado_tab.dart';
import 'package:direcionamento/theme/global_color.dart';
import 'package:flutter/material.dart';



class UniversityPage extends StatelessWidget {
  final University university;
  const UniversityPage({Key? key,required this.university}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0.1,
            backgroundColor: white,
            leading: IconButton(
              icon: Icon(Platform.isIOS ? Icons.arrow_back_ios: Icons.arrow_back,
                  color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(university.name,
                  style: TextStyle(color: Colors.black,fontSize: 16.0,fontWeight: FontWeight.w600),
                ),
              ],
            ),
            actions: <Widget>[
              IconButton(
                  icon: Icon(
                    Icons.settings,
                    color: Colors.black,
                  ),
                  onPressed: null),
            ],

            bottom: TabBar(
              indicatorColor: Colors.black,
              labelColor: Colors.black,
              unselectedLabelColor: primary,
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.home),
                  text: "Todos",
                ),
                Tab( icon: Icon(Icons.school_outlined),
                  text: "Mestrado",
                ),
                Tab(
                  icon: Icon(Icons.school),
                  text: "Licenciatura",
                ),
              ],
            ),
          ),
          backgroundColor: Color(0xfff0f0f0),
          body: TabBarView(children: [

            AllTab(),
            MestradoTab(),
            Text("data")
            //MestradoTab(),
            /* Column(
              children: [
                _buildStep(leadingTitle: "01", title: "Engenharia Inform??tica", content: "Os cursos de Engenharia Inform??tica da FENT t??m como objecto preparar Engenheiros inform??ticos de concep????o aptos a intervir em m??ltiplos sectores econ??micos."),
                _buildStep(leadingTitle: "02", title: "Inform??tica de Gest??o", content: "Os cursos de Engenharia Inform??tica da FENT t??m como objecto preparar Engenheiros inform??ticos de concep????o aptos a intervir em m??ltiplos sectores econ??micos.")
              ],
            ),*/
          ]),
        )
    );
  }
}

/*class UniversityPage extends StatefulWidget {
  final University university;
  const UniversityPage({Key? key, required this.university}) : super(key: key);

  @override
  State<UniversityPage> createState() => _UniversityPageState();
}

class _UniversityPageState extends State<UniversityPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0.1,
            backgroundColor: white,
            leading: IconButton(
              icon: Icon(Platform.isIOS ? Icons.arrow_back_ios: Icons.arrow_back,
                  color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Universidade Greg??rio Semedo".toUpperCase(),
                  style: TextStyle(color: Colors.black,fontSize: 15.0,fontWeight: FontWeight.w600),
                ),
              ],
            ),
            actions: <Widget>[
              IconButton(
                  icon: Icon(
                    Icons.settings,
                    color: Colors.black,
                  ),
                  onPressed: null),
            ],

            bottom: TabBar(
              indicatorColor: Colors.black,
              labelColor: Colors.black,
              unselectedLabelColor: primary,
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.home),
                  text: "Todos",
                ),
                Tab( icon: Icon(Icons.school_outlined),
                  text: "Mestrado",
                ),
                Tab(
                  icon: Icon(Icons.school),
                  text: "Licenciatura",
                ),
              ],
            ),
          ),
          backgroundColor: Color(0xfff0f0f0),
          body: TabBarView(children: [

            AllTab(),
            MestradoTab(),
            Text("data")
            //MestradoTab(),
           /* Column(
              children: [
                _buildStep(leadingTitle: "01", title: "Engenharia Inform??tica", content: "Os cursos de Engenharia Inform??tica da FENT t??m como objecto preparar Engenheiros inform??ticos de concep????o aptos a intervir em m??ltiplos sectores econ??micos."),
                _buildStep(leadingTitle: "02", title: "Inform??tica de Gest??o", content: "Os cursos de Engenharia Inform??tica da FENT t??m como objecto preparar Engenheiros inform??ticos de concep????o aptos a intervir em m??ltiplos sectores econ??micos.")
              ],
            ),*/
          ]),
        )
    );
  }
}*/
