import 'package:direcionamento/model/areaconhecimento_model.dart';
import 'package:direcionamento/screens/home_page/area_details_page.dart';
import 'package:flutter/material.dart';

class AreaList extends StatelessWidget {
  final AreaConhecimentoModel areaConhecimentoModel;
  const AreaList({Key? key, required this.areaConhecimentoModel}) : super(key: key);

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
              AreaDetailsPage(areaConhecimentoModel: areaConhecimentoModel,)));
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
