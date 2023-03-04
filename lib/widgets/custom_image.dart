import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:direcionamento/theme/global_color.dart';
import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  const CustomImage(
      this.image,
      {

        this.width = 100,
        this.height = 100,
        this.borderWidth =0,
        this.isShadow = true,
        this.borderColor,
        this.bgColor,
        this.trBackground = false,
        this.isNetwork = true,
        this.radius = 50,
        this.borderRadius,
        this.fit = BoxFit.cover
      });

  final String image;
  final double width;
  final double height;
  final double borderWidth;
  final bool isShadow;
  final Color? borderColor;
  final Color? bgColor;
  final bool trBackground;
  final bool isNetwork;
  final double radius;
  final BorderRadiusGeometry? borderRadius;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: bgColor,
            borderRadius: borderRadius ?? BorderRadius.circular(radius),
            boxShadow: [
              if(isShadow) BoxShadow(
                color: black.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(0, 1),
              )
            ]
        ),
        child: isNetwork ?
        CachedNetworkImage(
          imageUrl: image,
          placeholder: (context, url)  =>BlankImageWidget(),
          errorWidget: (context, url, error)  =>BlankImageWidget(),
          imageBuilder: (image, imageProvider)  => Container(
            decoration: BoxDecoration(
                borderRadius:  borderRadius ?? BorderRadius.circular(radius),
                image: DecorationImage(
                    image: imageProvider, fit: fit
                )
            ),
          ),
        ):
        Image(
          image: AssetImage(image),
          fit: fit,
        )
    );
  }


}

class BlankImageWidget extends StatefulWidget {
  const BlankImageWidget({Key? key}) : super(key: key);

  @override
  State<BlankImageWidget> createState() => _BlankImageWidgetState();
}

class _BlankImageWidgetState extends State<BlankImageWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Center(
        child: SizedBox(
          child: Card(
            margin: EdgeInsets.zero,
            clipBehavior: Clip.antiAlias,
            elevation: 0.0,
          ),
        ),
      ),
    );
  }
}
