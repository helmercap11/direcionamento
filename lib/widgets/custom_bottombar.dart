import 'dart:io';
import 'package:direcionamento/theme/global_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class CustomBottomBarItem extends StatelessWidget {
  const CustomBottomBarItem(this.icon, {this.onTap, this.color = Colors.grey, this.activeColor = primary, this.isActive = false, this.isNotified = false});
  final String icon;
  final Color color;
  final Color activeColor;
  final bool isNotified;
  final bool isActive;
  final GestureTapCallback ? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve:  Curves.fastOutSlowIn,
          padding: EdgeInsets.all(7),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: bottomBarColor,
              boxShadow: [
                if(isActive) BoxShadow(
                  color: shadowColor.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: Offset(0,0),
                )
              ]
          ),
          child: SvgPicture.asset(icon, color: isActive ? activeColor : color, width: 23, height:  23,)
      ),
    );
  }
}
