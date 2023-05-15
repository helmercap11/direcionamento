class Course {
  late final  String id, name,  image, about, years, regime, saida, disc;
  late final double price;

  Course(
      {
        required this.id,
        required this.name,
      required this.image,
      required this.about,
      required this.years,
      required this.regime,
      required this.saida,
      required this.disc,
      required this.price
      });

  Course.fromJson(Map<String, dynamic> json){
    id = json['idcurso'];
    name = json['designacao'];
    //icon = json['icon'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idcurso'] = id;
    data['designacao'] = name;
   // data['icon'] = icon;
    return data;
  }
}
