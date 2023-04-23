class CategoriesModel {
   int id = 0;
   String name_categoria = "";
   dynamic icon = "";

  CategoriesModel(this.id, this.name_categoria, {this.icon});

  CategoriesModel.fromJson(Map<String, dynamic> json){
    id = json['idcategoria'];
    name_categoria = json['categoria'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idcategoria'] = id;
    data['categoria'] = name_categoria;
    data['icon'] = icon;
    return data;
  }

}