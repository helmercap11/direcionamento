import 'package:direcionamento/widgets/custom_categories.dart';
import 'package:flutter/material.dart';

import '../../model/categories_model.dart';

class ListCategoria extends StatelessWidget {
  final List<CategoriesModel> categoriamodel;
  const ListCategoria({Key? key,  required this.categoriamodel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(15, 10, 0, 10),
      scrollDirection: Axis.horizontal,
      child: Row(
          children: List.generate(categoriamodel.length, (index) {
            final item = categoriamodel[index];
            return  Padding(
                padding: const EdgeInsets.only(right: 15),
                child: CustomCategories(
                    categoria: item.name_categoria.toString(),
                    icon: item.icon.toString()
                )
            );
          }

          )
      ),
    );
  }
}
