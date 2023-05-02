import 'dart:convert';

NivelAcademicoModel nivelFromJson(String str) => NivelAcademicoModel.fromJson(jsonDecode(str));
String nivelToJson(NivelAcademicoModel data) => jsonEncode(data.toJson());

class NivelAcademicoModel {
  late String id;
  late String descricao;

  List<NivelAcademicoModel> toList = [];
  NivelAcademicoModel({required this.id, required this.descricao});

  factory NivelAcademicoModel.fromJson(Map<String, dynamic> json)=> NivelAcademicoModel(
      id: json["idnivelacademico"] is int ? json["idnivelacademico"].toString(): json["idnivelacademico"],
      descricao: json["descricao"]
  );


  NivelAcademicoModel.fromJsonList(List<dynamic> jsonList){
    if(jsonList == null) return;

    jsonList.forEach((item) {
      NivelAcademicoModel nivel = new NivelAcademicoModel.fromJson(item);
      toList.add(nivel);
    });
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "descricao": descricao,
  };

}