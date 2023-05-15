import 'package:cached_network_image/cached_network_image.dart';
import 'package:direcionamento/model/instituicao_model.dart';
import 'package:direcionamento/theme/global_color.dart';
import 'package:flutter/material.dart';



class InstituicaoDetails extends StatefulWidget {
  final InstituicaoModel instituicaoModel;
  const InstituicaoDetails({Key? key, required this.instituicaoModel}) : super(key: key);

  @override
  State<InstituicaoDetails> createState() => _InstituicaoDetailsState();
}

class _InstituicaoDetailsState extends State<InstituicaoDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:  Text(widget.instituicaoModel.name, style: TextStyle(color: Colors.black),),
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
        ),
        body:Container(
          padding: EdgeInsets.only(left: 15, right: 15, bottom: 150),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Image.network(widget.instituicaoModel.image) /*Image.asset(widget.instituicaoModel.image)*/,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3.0)),
                elevation: 1,
                margin: EdgeInsets.all(5),
              ),
              Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(widget.instituicaoModel.name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),

                    ],
                  ),
                ],
              ),
              //SizedBox(height: 5,),
              SizedBox(height: 6,),

              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Icon(Icons.location_on,
                            color: black,
                            size: 18,),
                          SizedBox(width: 5,),
                          Text(widget.instituicaoModel.provincia, style: TextStyle(
                              color: black,
                              fontSize: 16,
                              letterSpacing: .3
                          ),)
                        ],
                      ),
                    ),
                    SizedBox(width: 175,),
                    Expanded(child: Text(widget.instituicaoModel.location, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),)),
                    /*SizedBox(width: 10,),
                    Expanded(child: CustomSettingBox(title: "4.8", icon: "assets/icons/star.svg"))*/
                  ],
                ),
              ),
              SizedBox(height: 10,),

              Container(
                child: Text(
                  "Derivado do leite, em sua fabricação são adicionadas bactérias que atuam no organismo para melhorar o funcionamento do sistema imunológico.",
                  style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black87,
                      fontWeight: FontWeight.w400,
                      height: 1.50),
                  textAlign: TextAlign.justify,
                ),
              )
            ],
          ),
        ),
      /*Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Column(
                  children: [
                    Image.asset(
                        "assets/images/ugs.png",
                        width: double.infinity,
                        height: 300,
                        fit: BoxFit.cover),
                    /*Positioned(
                      // The Positioned widget is used to position the text inside the Stack widget
                      bottom: 10,
                      right: 10,

                      child: Container(
                        // We use this Container to create a black box that wraps the white text so that the user can read the text even when the image is white
                        width: 300,
                        color: Colors.black54,
                        padding: const EdgeInsets.all(15),
                        child:  Text(
                          widget.instituicaoModel.name,
                          style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),*/
                  ],
                )
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 15, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.instituicaoModel.provincia),
                    SizedBox(height: 12.0,),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text("Data:"),
                          ),
                          SizedBox(width: 100,),
                          Expanded(child: Text(widget.instituicaoModel.location))
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            )

          ],

        )*/
    );
  }
}
