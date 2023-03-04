import 'dart:io';
import 'package:direcionamento/theme/global_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';




class CustomSettingBox extends StatelessWidget {
  const CustomSettingBox({Key? key, this.title, required this.icon,  this.color = darker}) : super(key: key);
  final title;
  final String icon;
  final Color color;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: shadowColor.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(0, 1)
            )
          ]

      ),
      child: Column(
        children: [
          SvgPicture.asset(icon, color: color, width: 22, height: 22,),
          SizedBox(height: 7,),
          Text(title, style: TextStyle(color: color, fontSize: 14, fontWeight: FontWeight.w500),)
        ],
      ),
    ) ;
  }
}
