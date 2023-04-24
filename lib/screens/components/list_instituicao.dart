import 'package:carousel_slider/carousel_slider.dart';
import 'package:direcionamento/screens/school_page/university_page.dart';
import 'package:direcionamento/widgets/custom_instituicao_item.dart';
import 'package:flutter/material.dart';

import '../../model/instituicao_model.dart';


class ListInstituicao extends StatelessWidget {
  final List<InstituicaoModel> instituicaoModel;
  const ListInstituicao({Key? key, required this.instituicaoModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        options: CarouselOptions(
          height: 290,
          enlargeCenterPage: true,
          disableCenter: true,
          viewportFraction: .75
        ),
        items: List.generate(instituicaoModel.length, (index) {
          final item = instituicaoModel[index];
          return CustomInstituicaoItem(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) =>UniversityPage(university: item,)));
            },
              name: item.name.toString(),
              image: item.image.toString(),
              location: item.location.toString(),
              province: item.provincia.toString(),
              tipo: item.tipo.toString()
          );
        }),

    );
  }
}
