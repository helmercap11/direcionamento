import 'dart:convert';
import 'dart:io';
import 'package:direcionamento/controllers/areaconhecimento_controller.dart';
import 'package:direcionamento/model/areaconhecimento_model.dart';
import 'package:direcionamento/provider/user_provider.dart';
import 'package:direcionamento/theme/global_color.dart';
import 'package:direcionamento/widgets/Custom_settingbox.dart';
import 'package:direcionamento/widgets/bottomNavigationBar.dart';
import 'package:direcionamento/widgets/custom_image.dart';
import 'package:direcionamento/widgets/custom_settingitem.dart';
import 'package:flutter/material.dart';

import '../../model/user_model.dart';
import '../../utils/data.dart';


class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);


  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {

  UserProvider userProvider = UserProvider();
  AreaConhecimentoController controller = AreaConhecimentoController();
  //late Future<List<UserModel>> users;
  //late List users;

  String idusuario ="f300fceb-fa51-4b78-9e20-cfd138d028d0";
  var users = <AreaConhecimentoModel>[];
  _getUsers() {
    //userProvider.readUsers();
    controller.fetchAreas();


  }

  @override
  void initState() {
    super.initState();
    _getUsers();
      //userProvider.readUsers(idusuario);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: appBarColor,
            foregroundColor: black,
            pinned: true,
            snap: true,
            floating: true,
            title: getHeader(),
          ),
          SliverToBoxAdapter(
            child: getBody(),
          ),
        ],
      ),
      bottomNavigationBar: BootomNavigationBar(),
    );
  }


  getHeader(){

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Conta", style: TextStyle(color: mainColor, fontSize: 24, fontWeight: FontWeight.w600),),
        ],
      ),
    );
  }

  Widget getBody(){
    return SingleChildScrollView(
      padding: EdgeInsets.only(left: 15, right: 15),
      child: ListView.builder(
          itemCount: users.length ,
          itemBuilder: (BuildContext context, int index) {
            var name = users[index].name;
            return ListTile(
              title: Text(name),
            );
          }
      )
      /*Column(
        children: [
          Column(
            children: [
              CustomImage(
                profile["image"]!,
                width: 70,
                height: 70,
                radius: 20,
              ),
              SizedBox(height: 10,),
              Text(profile["name"]!, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),)
            ],
          ),
          SizedBox(height: 20,),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CustomSettingBox(title: "Pontuações" , icon: "assets/icons/work.svg"),
                ),
                SizedBox(width: 10,),
                Expanded(child: CustomSettingBox(title: "Activo",icon: "assets/icons/time.svg" ),),
                SizedBox(width: 10,),
                Expanded(child: CustomSettingBox(title: "4.8", icon: "assets/icons/star.svg"))
              ],
            ),
          ),
          SizedBox(height: 20,),
          Container(
            padding: const EdgeInsets.only(left: 15, right: 15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: cardColor,
                boxShadow: [
                  BoxShadow(
                    color: shadowColor.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(0,1),
                  )
                ]
            ),
            child: Column(
              children: [
                CustomSettingItem(
                  title: " Confirgurações",
                  leadingIcon: "assets/icons/setting.svg",
                  bgIconColor: blue,
                  onTap: (){
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 45),
                  child: Divider(height: 0, color: Colors.grey.withOpacity(0.8),),
                ),
                CustomSettingItem(
                  title: " Pagamento",
                  leadingIcon: "assets/icons/wallet.svg",
                  bgIconColor: green,
                  onTap: () {},
                ),
                Padding(padding: const EdgeInsets.only(left: 45),
                  child: Divider(height: 0,color: Colors.grey.withOpacity(0.9),),
                ),
                CustomSettingItem(title: " Nivel Academico",
                  leadingIcon: "assets/icons/category/education.svg",)
              ],
            ),
          ),
          SizedBox(height:  20,),
          Container(
            padding: EdgeInsets.only(left: 15, right: 15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: cardColor,
                boxShadow: [
                  BoxShadow(
                      color: shadowColor.withOpacity(0.1),
                      blurRadius: 1,
                      spreadRadius: 1,
                      offset: Offset(0,1)
                  )
                ]
            ),
            child:  Column(
              children: [
                CustomSettingItem(title: " Notificações",
                  leadingIcon: "assets/icons/bell.svg",
                  bgIconColor: purple,
                  onTap: (){},
                ),
                Padding(padding: const EdgeInsets.only(left: 45),
                  child: Divider(height: 0, color: Colors.grey.withOpacity(0.8),),
                ),
                CustomSettingItem(title: " Privacidade",
                  leadingIcon: "assets/icons/shield.svg",
                  bgIconColor: orange,
                  onTap: () {},
                )
              ],
            ),
          ),
          SizedBox(height: 20,),
          Container(
            padding: const EdgeInsets.only(left: 15, right: 15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: cardColor,
                boxShadow: [
                  BoxShadow(
                      color: shadowColor.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(0,1)
                  )
                ]
            ),
            child:  Column(
              children: [
                CustomSettingItem(title: " Terminar sessão",
                  leadingIcon: "assets/icons/logout.svg",
                  bgIconColor: darker,
                  onTap: (){},
                )
              ],
            ),
          )
        ],
      ),*/

    );
  }


}
