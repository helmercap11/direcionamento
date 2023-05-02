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


  factory UserModel.fromJson(Map<String, dynamic> json)  =>
      UserModel(
          idusuario: json['idusuario']is int ? json["idusuario"].toString() : json["idusuario"],
          name: json['nome'],
          email: json['email'],
          password: json['senha'],
          idnivelacademico: json['nivelacademico_idnivelacademico']is String
              ? int.parse(json["nivelacademico_idnivelacademico"])
              : json["nivelacademico_idnivelacademico"]);

  UserModel.fromJsonList(List<dynamic> jsonList){
    if(jsonList == null) return;

    jsonList.forEach((element) {
      UserModel model = new UserModel.fromJsonList(element);
    });
  }

  Map<String, dynamic> toJson() => {
    "idusuario": idusuario,
    "nome": name,
    "email": email,
    "senha": password,
    "nivelacademico_idnivelacademico": idnivelacademico
  };


  static bool isInteger(num value) =>
      value is int || value == value.roundToDouble();

}