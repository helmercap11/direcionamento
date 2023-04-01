

class AreaConhecimentoModel {
  int idareaconhecimento = 0;
  String name = "";
  //bool isSelected = false;

  AreaConhecimentoModel(this.idareaconhecimento,this.name,/*this.isSelected*/);


   AreaConhecimentoModel.fromJson(Map<String, dynamic> json){
     idareaconhecimento = json['idareaconhecimento'];
     name = json['descricao'];
   // isSelected = json['false'];
  }

  Map<String, dynamic> toJson(){
      final Map<String, dynamic> data  = <String, dynamic>{};
      data['idareaconhecimento'] = idareaconhecimento;
      data['descricao'] = name;
      //data['false'] = isSelected;
      return data;
  }
}