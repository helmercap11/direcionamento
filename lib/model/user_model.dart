import 'dart:convert';
UserModel UserModelFromJson(String str) =>
    UserModel.fromJson(jsonDecode(str));

String UserModelToJson(UserModel data) =>
    jsonEncode(data.toJson());

class UserModel{
 late String? idusuario;
 late String name;
 late String email;
 late String password;
 late int idnivelacademico;

  UserModel(
      { this.idusuario,
        required this.name,
        required this.email,
        required this.password,
        required this.idnivelacademico});

 List<UserModel> toList = [];
  factory UserModel.fromJson(Map<String, dynamic> json)  =>
      UserModel(
          //idusuario: json['idusuario']is int ? json["idusuario"].toString() : json["idusuario"],
          idusuario: json['idusuario'],
          name: json['nome'],
          email: json['email'],
          password: json['senha'],
          idnivelacademico: json['idnivelacademico']is String
              ? int.parse(json["idnivelacademico"])
              : json["idnivelacademico"]);

  UserModel.fromJsonList(List<dynamic> jsonList){
    if(jsonList == null) return;

    jsonList.forEach((element) {
      UserModel model = new UserModel.fromJsonList(element);
      toList.add(model);
    });
  }

  Map<String, dynamic> toJson() => {
    "idusuario": idusuario,
    "nome": name,
    "email": email,
    "senha": password,
    "idnivelacademico": idnivelacademico
  };


  static bool isInteger(num value) =>
      value is int || value == value.roundToDouble();

}