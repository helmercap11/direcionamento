import 'package:direcionamento/model/instituicao_model.dart';
import 'package:direcionamento/screens/search_school/details_instituicao.dart';
import 'package:direcionamento/utils/constant.dart';
import 'package:flutter/material.dart';

import '../../../theme/global_color.dart';
import '../../../utils/data.dart';


class InstituicaoList extends StatefulWidget {
  final InstituicaoModel instituicaoModel;
  const InstituicaoList({Key? key, required this.instituicaoModel}) : super(key: key);

  @override
  State<InstituicaoList> createState() => _InstituicaoListState();
}

class _InstituicaoListState extends State<InstituicaoList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: (){
          Navigator.push(context,
              MaterialPageRoute(builder: (context)=>
                  InstituicaoDetails(instituicaoModel: widget.instituicaoModel,)));
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.white,
          ),
          height: 130,
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
                        image: NetworkImage(widget.instituicaoModel.image.toString()),fit: BoxFit.fill
                    )
                ),
              ),
              Expanded(
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.instituicaoModel.name,style:
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
                          Text(widget.instituicaoModel.provincia, style: TextStyle(
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
                          Text(widget.instituicaoModel.tipo,style:
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
        ),
      ),
    );
    /*Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: Image.asset('assets/images/ugs.png'),
                  title: Text(widget.instituicaoModel.name),
                  subtitle: Text(widget.instituicaoModel.location),
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>
                            InstituicaoDetails(instituicaoModel: widget.instituicaoModel,)));
                  },
                ),
              ],
            ),
          ),

          const Divider(
            thickness: 2.0,
          )
        ],
      ),
    );*/
  }
}
