import 'package:direcionamento/model/areaconhecimento_model.dart';
import 'package:direcionamento/model/course.dart';
import 'package:direcionamento/screens/home_page/area_details_page.dart';
import 'package:flutter/material.dart';



class AreaList extends StatefulWidget {
  final AreaConhecimentoModel areaConhecimentoModel;
  final Course ? course;
  const AreaList({Key? key, required this.areaConhecimentoModel, this.course}) : super(key: key);

  @override
  State<AreaList> createState() => _AreaListState();
}

class _AreaListState extends State<AreaList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          ListTile(

            title: Text(widget.areaConhecimentoModel.name),
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>
                      AreaDetailsPage(areaConhecimentoModel: widget.areaConhecimentoModel, course: widget.course,)));
            },
          ),
          const Divider(
            thickness: 2.0,
          )
        ],
      ),
    );
  }
}

/*class AreaList extends StatelessWidget {
  final AreaConhecimentoModel areaConhecimentoModel;
  final Course ? course;
  const AreaList({Key? key, required this.areaConhecimentoModel, this.course}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          ListTile(

            title: Text(areaConhecimentoModel.name),
            onTap: (){
              Navigator.push(context, 
              MaterialPageRoute(builder: (context)=>
              AreaDetailsPage(areaConhecimentoModel: areaConhecimentoModel, course: course,)));
            },
          ),
        const Divider(
          thickness: 2.0,
        )
        ],
      ),
    );
  }
}*/
