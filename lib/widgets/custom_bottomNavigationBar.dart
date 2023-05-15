import 'package:direcionamento/screens/account/profile.dart';
import 'package:direcionamento/screens/school_page/institucao_page.dart';
import 'package:direcionamento/screens/search_school/search_instituicao.dart';
import 'package:direcionamento/screens/search_school/search_school.dart';
import 'package:direcionamento/theme/global_color.dart';
import 'package:flutter/material.dart';



class CustomBootomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bottomBarColor,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(0)),
        boxShadow: [
          BoxShadow(
              offset: Offset(0.0, 1.00), //(x,y)
              blurRadius: 4.00,
              color: shadowColor.withOpacity(0.1),
              spreadRadius: 1.00),
        ],
      ),
      height: 70,
      child: ClipRRect(
          clipBehavior: Clip.hardEdge,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),),
          child: Container(
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: bottomBarColor,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              currentIndex: 2,
              elevation: 0,
              unselectedItemColor: black,
              selectedItemColor: primary,

              // new
              items: [
                new BottomNavigationBarItem(
                  icon: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> InstituicaoPage()));
                    },
                    child: Icon(
                      Icons.home,
                      size: 30,
                      //color: primary,
                    ),
                  ),
                  label: 'Home',
                ),
                new BottomNavigationBarItem(
                  icon: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SearchInstituicao()));
                    },
                    child: Icon(
                      Icons.search,
                      size: 30,
                      //color: primary,
                    ),
                  ),
                  label: 'Menu',
                ),
                new BottomNavigationBarItem(
                  icon: Container(
                    child: CircleAvatar(
                      //backgroundColor: red,
                      child: Icon(
                        Icons.add,
                        size: 30,
                        //color: Colors.white,
                      ),
                    ),
                  ),
                 label: 'add',
                ),
                new BottomNavigationBarItem(
                  icon: InkWell(
                    onTap: () {
                      /*Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NotificationsPage()));*/
                    },
                    child: Icon(
                      Icons.location_on,
                      size: 30,
                      //color: primary,
                    ),
                  ),
                 label: 'Noti',
                ),
                new BottomNavigationBarItem(
                    icon: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Profile()));
                      },
                      child: Icon(
                        Icons.person,
                        size: 30,
                        //color: primary,
                      ),
                    ),
                    label: 'Account')
              ],
            ),
          )),
    );
  }
}