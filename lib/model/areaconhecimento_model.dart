

class AreaConhecimentoModel {
  String name = "";
  bool isSelected = false;

  AreaConhecimentoModel(this.name, this.isSelected);


   AreaConhecimentoModel.fromJson(Map<String, dynamic> json){
    name = json['descricao'];
    isSelected = json['false'];
  }

  Map<String, dynamic> toJson(){
      final Map<String, dynamic> data  = <String, dynamic>{};
      data['descricao'] = name;
      data['false'] = isSelected;
      return data;
  }
}