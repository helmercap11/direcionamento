class InstituicaoModel {
  String id ="";
 String name = "",image ="",location ="", provincia ="", tipo="";


  InstituicaoModel(this.id, this.name, this.image, this.location, this.provincia, this.tipo);


  InstituicaoModel.fromJson(Map<String, dynamic> json){
    id = json['idinstituicao'];
    name = json['designacao'];
    image = json['logo'];
    location = json['localizacao'];
    provincia = json['provincia'];
    tipo = json['tipo'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idinstituicao'] = id;
    data['designacao'] = name;
    data['logo'] = image;
    data['localizacao'] = location;
    data['provincia'] = provincia;
    data['tipo'] = tipo;

    return data;
  }
}