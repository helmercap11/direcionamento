import 'package:direcionamento/model/Categories.dart';
import 'package:direcionamento/model/course.dart';
import 'package:direcionamento/model/university.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../model/FieldStudyModel.dart';
import '../model/Question.dart';

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


List<Categories> categorie = [
Categories(9, "Programação", icon: Icons.code),
Categories(10, "Musica", icon: Icons.music_note),
Categories(11, "Books", icon: Icons.book),
Categories(12, "Construção", icon: Icons.construction),
Categories(13, "Construção", icon: Icons.construction),
Categories(14, "Construção", icon: Icons.construction),
Categories(15, "Construção", icon: Icons.construction),
Categories(16, "Transporte", icon: Icons.bus_alert_outlined),
Categories(17, "Finanças", icon: Icons.money),
Categories(18, "Arte", icon: Icons.art_track),
];


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



final List<Question> demoQuestions = Question.fromData([
  {
    "categoria": "Science: Computers",
    "type": "multiple",
    "difficulty": "easy",
    "question": "O que significa \"MP\" em MP3?",
    "correct_answer": "Reprodutor de música",
    "incorrect_answers": ["Music Picture", "Multi Pass", "Micro Point"]
  },
  {
    "categoria": "Science: Computers",
    "type": "multiple",
    "difficulty": "easy",
    "question": "Que quantidade de bits geralmente equivale a um byte?",
    "correct_answer": "8",
    "incorrect_answers": ["1", "2", "64"]
  },
  {
    "categoria": "Science: Computers",
    "type": "multiple",
    "difficulty": "easy",
    "question":
    "Qual dispositivo de hardware de computador fornece uma interface para todos os outros dispositivos conectados se comunicarem?",
    "correct_answer": "Motherboard",
    "incorrect_answers": [
      "Central Processing Unit",
      "Hard Disk Drive",
      "Random Access Memory"
    ]
  },
  {
    "categoria": "Science: Computers",
    "type": "multiple",
    "difficulty": "easy",
    "question": "Em web design, o que significa CSS?",
    "correct_answer": "Folha de estilo",
    "incorrect_answers": [
      "Counter Strike: Source",
      "Corrective Style Sheet",
      "Computer Style Sheet"
    ]
  },
  {
    "categoria": "Science: Computers",
    "type": "multiple",
    "difficulty": "easy",
    "question":
    "Qual é o codinome do sistema operacional móvel Android 7.0?",
    "correct_answer": "Nougat-Teste",
    "incorrect_answers": ["Ice Cream Sandwich", "Jelly Bean", "Marshmallow"]
  },
  {
    "categoria": "Science: Computers",
    "type": "multiple",
    "difficulty": "easy",
    "question": "No Twitter, qual é o limite de caracteres para um Tweet?",
    "correct_answer": "140",
    "incorrect_answers": ["120", "160", "100"]
  },
  {
    "categoria": "Science: Computers",
    "type": "multiple",
    "difficulty": "easy",
    "question":
    "Com qual linguagem de computador você associaria o framework Django?",
    "correct_answer": "Python",
    "incorrect_answers": ["C#", "C++", "Java"]
  },
  {
    "categoria": "Science: Computers",
    "type": "boolean",
    "difficulty": "easy",
    "question": "O sistema operacional Windows 7 possui seis edições principais.",
    "correct_answer": "True",
    "incorrect_answers": ["False"]
  },
  {
    "categoria": "Science: Computers",
    "type": "multiple",
    "difficulty": "easy",
    "question":
    "Qual linguagem de programação compartilha seu nome com uma ilha na Indonésia?",
    "correct_answer": "Java",
    "incorrect_answers": ["Python", "C", "Jakarta"]
  }
]);




