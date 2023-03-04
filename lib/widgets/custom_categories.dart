import 'dart:io';
import 'package:direcionamento/theme/global_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';




class CustomCategories extends StatelessWidget {
  const CustomCategories({this.data,  this.selectedColor = actionColor,  this.isSelected = false, this.onTap });

  final data;
  final Color selectedColor;
  final bool isSelected;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.fastOutSlowIn,
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: isSelected ? red : Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: black.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(1,1),
                  )
                ],
                shape: BoxShape.circle
            ),
            child: SvgPicture.asset(data["icon"], color: isSelected ? selectedColor : textColor, width: 30, height: 30,),
          ),
          SizedBox(height: 10,),
          Text(data["name"], maxLines: 1,overflow: TextOverflow.fade,
            style: TextStyle(color: textColor, fontWeight: FontWeight.w500),)
        ],
      ),
    );
  }
}