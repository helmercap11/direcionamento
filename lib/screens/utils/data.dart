import 'package:direcionamento/model/Category.dart';
import 'package:direcionamento/model/course.dart';
import 'package:direcionamento/model/university.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../model/FieldStudyModel.dart';

var profile = {
  "name" : "Helmer Capassola",
  "image" : "https://images.unsplash.com/photo-1574027542183-77efe00ca49f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGluZm9ybWF0aWNhfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
  "email" : "helmer@gmail.com"
};

List<FieldStudyModel> studyModel =[
  FieldStudyModel("Ciências Exatas", false),
  FieldStudyModel("Ciências Biológicas", false),
  FieldStudyModel("Ciências da Saúde", false),
  FieldStudyModel("Ciências Agrárias", false),
  FieldStudyModel("Ciências Humanas", false),
  FieldStudyModel("Ciências Sociais Aplicadas", false),
  FieldStudyModel("Engenharias", false),
  FieldStudyModel("Linguística, Letras e Artes", false),
];


/*List<Category> categories = [
  Category(1, "Todos", icon: SvgPicture.asset("assets/icons/category/education.svg")),
  Category(2, "Todos", icon: SvgPicture.asset("assets/icons/category/education.svg")),
  Category(3, "Todos", icon: SvgPicture.asset("assets/icons/category/education.svg")),
  Category(4, "Todos", icon: SvgPicture.asset("assets/icons/category/education.svg")),
  Category(5, "Todos", icon: SvgPicture.asset("assets/icons/category/education.svg")),
  Category(6, "Todos", icon: SvgPicture.asset("assets/icons/category/education.svg")),
];*/


List categories = [
  {
    "name": "Todos",
    "icon": "assets/icons/category/all.svg"
  },
  {
    "name": "Educação",
    "icon": "assets/icons/category/education.svg"
  },
  {
    "name": "Programação",
    "icon": "assets/icons/category/coding.svg"
  },
  {
    "name": "Negócio",
    "icon": "assets/icons/category/business.svg"
  },
  {
    "name": "Finanças",
    "icon": "assets/icons/category/finance.svg"
  },
  {
    "name": "Arte",
    "icon": "assets/icons/category/art.svg"
  },
  {
    "name": "Gastronomia",
    "icon": "assets/icons/category/cooking.svg"
  },
];


List<University> universty =[
  University(
      id: 1,
      name: "Universidade Gregório Semedo",
      image: "https://images.unsplash.com/photo-1574027542183-77efe00ca49f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGluZm9ybWF0aWNhfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
      location: "Luanda"
  ),
  University(
      id: 2,
      name: "Universidade Técnica de Angola",
      image: "https://images.unsplash.com/photo-1574027542183-77efe00ca49f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGluZm9ybWF0aWNhfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
      location: "Luanda"
  ),
  University(
      id: 3,
      name: "Universidade Lusiada de Angola",
      image: "https://images.unsplash.com/photo-1574027542183-77efe00ca49f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGluZm9ybWF0aWNhfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
      location: "Luanda"
  ),
  University(
      id: 4,
      name: "Universidade Agostinho Neto",
      image: "https://images.unsplash.com/photo-1574027542183-77efe00ca49f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGluZm9ybWF0aWNhfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
      location: "Luanda"
  ),

];


List <Course> courses = [
  Course(
    //idcurso: 1,
      name: "Engenharia Informática",
      image: "https://images.unsplash.com/photo-1574027542183-77efe00ca49f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGluZm9ybWF0aWNhfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
      about: "1 Os cursos de Engenharia Informática da FENT têm como objecto preparar Engenheiros informáticos de concepção aptos a intervir em múltiplos sectores económicos.",
      years: "4 Anos",
      price: 100.0,
      disc:"As principais saídas profissionais previstas para os Engenheiros Informáticos licenciados na UGS são o exercício de funções técnicas e de direcção:",
      regime: "Através do Curso de Acesso à UGS ou por Exame às disciplinas de: Português + Matemática.",
      saida: "As principais saídas profissionais previstas para os Engenheiros Informáticos licenciados na UGS são o exercício de funções técnicas e de direcção:"

  ),
  Course(
    // idcurso: 2,
      name: "Informática de Gestão",
      image: "https://images.unsplash.com/photo-1574027542183-77efe00ca49f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGluZm9ybWF0aWNhfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
      about: "2 Os cursos de Engenharia Informática da FENT têm como objecto preparar Engenheiros informáticos de concepção aptos a intervir em múltiplos sectores económicos.",
      years: "2023",
      price: 100.0,
      disc:"As principais saídas profissionais previstas para os Engenheiros Informáticos licenciados na UGS são o exercício de funções técnicas e de direcção:",
      regime: "Através do Curso de Acesso à UGS ou por Exame às disciplinas de: Português + Matemática.",
      saida: "As principais saídas profissionais previstas para os Engenheiros Informáticos licenciados na UGS são o exercício de funções técnicas e de direcção:"
  ),
  Course(
    // idcurso: 3,
      name: "Direito",
      image: "https://images.unsplash.com/photo-1574027542183-77efe00ca49f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGluZm9ybWF0aWNhfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
      about: "3 Os cursos de Engenharia Informática da FENT têm como objecto preparar Engenheiros informáticos de concepção aptos a intervir em múltiplos sectores económicos.",
      years: "2023",
      price: 100.0,
      disc:"As principais saídas profissionais previstas para os Engenheiros Informáticos licenciados na UGS são o exercício de funções técnicas e de direcção:",
      regime: "Através do Curso de Acesso à UGS ou por Exame às disciplinas de: Português + Matemática.",
      saida: "As principais saídas profissionais previstas para os Engenheiros Informáticos licenciados na UGS são o exercício de funções técnicas e de direcção:"
  ),
  Course(
    // idcurso: 4,
      name: "Engenharia Informática",
      image: "https://images.unsplash.com/photo-1574027542183-77efe00ca49f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGluZm9ybWF0aWNhfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
      about: "4 Os cursos de Engenharia Informática da FENT têm como objecto preparar Engenheiros informáticos de concepção aptos a intervir em múltiplos sectores económicos.",
      years: "2023",
      price: 100.0,
      disc:"As principais saídas profissionais previstas para os Engenheiros Informáticos licenciados na UGS são o exercício de funções técnicas e de direcção:",
      regime: "Através do Curso de Acesso à UGS ou por Exame às disciplinas de: Português + Matemática.",
      saida: "As principais saídas profissionais previstas para os Engenheiros Informáticos licenciados na UGS são o exercício de funções técnicas e de direcção:"
  ),
  Course(
    //idcurso: 5,
      name: "Engenharia Informática",
      image: "https://images.unsplash.com/photo-1574027542183-77efe00ca49f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGluZm9ybWF0aWNhfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
      about: "Os cursos de Engenharia Informática da FENT têm como objecto preparar Engenheiros informáticos de concepção aptos a intervir em múltiplos sectores económicos.",
      years: "2023",
      price: 100.0,
      disc:"As principais saídas profissionais previstas para os Engenheiros Informáticos licenciados na UGS são o exercício de funções técnicas e de direcção:",
      regime: "Através do Curso de Acesso à UGS ou por Exame às disciplinas de: Português + Matemática.",
      saida: "As principais saídas profissionais previstas para os Engenheiros Informáticos licenciados na UGS são o exercício de funções técnicas e de direcção:"
  ),
  Course(
    // idcurso: 6,
      name: "Engenharia Informática",
      image: "https://images.unsplash.com/photo-1574027542183-77efe00ca49f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGluZm9ybWF0aWNhfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
      about: "Os cursos de Engenharia Informática da FENT têm como objecto preparar Engenheiros informáticos de concepção aptos a intervir em múltiplos sectores económicos.",
      years: "2023",
      price: 100.0,
      disc:"As principais saídas profissionais previstas para os Engenheiros Informáticos licenciados na UGS são o exercício de funções técnicas e de direcção:",
      regime: "Através do Curso de Acesso à UGS ou por Exame às disciplinas de: Português + Matemática.",
      saida: "As principais saídas profissionais previstas para os Engenheiros Informáticos licenciados na UGS são o exercício de funções técnicas e de direcção:"
  ),



];


