import 'package:direcionamento/model/Categories.dart';
import 'package:direcionamento/model/course.dart';
import 'package:direcionamento/model/high_school.dart';
import 'package:direcionamento/model/university.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../model/areaconhecimento_model.dart';
import '../model/Question.dart';

var profile = {
  "name" : "Helmer Capassola",
  "image" : "https://scontent.flad7-1.fna.fbcdn.net/v/t1.6435-1/71971252_3220039168068994_3973434379090264064_n.jpg?stp=dst-jpg_p240x240&_nc_cat=102&ccb=1-7&_nc_sid=7206a8&_nc_ohc=515ZR69rFywAX_HPuE6&_nc_ht=scontent.flad7-1.fna&oh=00_AfAd_aYrGps2fj7EcfwOaXWVV0TG1pqAJbYTwZIBq25pFA&oe=642C6B90",
  "email" : "helmer@gmail.com"
};

/*List<AreaConhecimentoModel> studyModel =[
  AreaConhecimentoModel("Ciências Exatas", false),
  AreaConhecimentoModel("Ciências Biológicas", false),
  AreaConhecimentoModel("Ciências da Saúde", false),
  AreaConhecimentoModel("Ciências Agrárias", false),
  AreaConhecimentoModel("Ciências Humanas", false),
  AreaConhecimentoModel("Ciências Sociais Aplicadas", false),
  AreaConhecimentoModel("Engenharias", false),
  AreaConhecimentoModel("Linguística, Letras e Artes", false),
];*/


List<Categories> categorie = [
Categories(1, "Programação", icon: Icons.code),
Categories(2, "Medicina", icon: Icons.local_hospital),
Categories(3, "Construção", icon: Icons.engineering),
Categories(3, "Desporto", icon: Icons.sports_baseball_rounded),
Categories(5, "Gestão e Marketing", icon: Icons.manage_accounts),
Categories(6, "Contablidade", icon: Icons.money),
Categories(7, "Arte", icon: Icons.design_services),
Categories(8, "Transporte", icon: Icons.car_crash),
Categories(9, "Petroleo", icon: Icons.local_gas_station_outlined),
Categories(10, "Ambiente", icon: Icons.airplane_ticket),
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
     image: "https://scontent.flad7-1.fna.fbcdn.net/v/t39.30808-6/327252443_529509672326203_5567456296555804560_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=yPA6hxwESHUAX8-CBcL&_nc_ht=scontent.flad7-1.fna&oh=00_AfAPz-JSQ_eVMx5oWJfvO2m00SUZaND-_bUMTIsqlKlApg&oe=640AB3D7",
     location: "Luanda"
  ),
  University(
      id: 2,
      name: "Universidade Técnica de Angola",
      image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRhQOchXtHMcqizuaA_TIXCUW6dCjRSqMwyUOACOOBXqA&s",
      location: "Luanda"
  ),
  University(
      id: 3,
      name: "Universidade Lusiada de Angola",
      image: "https://upload.wikimedia.org/wikipedia/en/2/24/Universidade_Lus%C3%ADada_de_Angola_Logo.png",
      location: "Luanda"
  ),
  University(
      id: 4,
      name: "Universidade Agostinho Neto",
      image: "https://upload.wikimedia.org/wikipedia/pt/a/a5/Logotipo_da_UAN.png?20170108014501",
      location: "Luanda"
  ),

];



List<HighSchool> higschool =[
  HighSchool(
      id: 1,
      name: "ITEL",
      image: "https://itel.gov.ao/edu/assets/img/core-img/logo.png",
      location: "Luanda"
  ),
  HighSchool(
      id: 2,
      name: "Makarengo",
       image: "https://scontent.flad7-1.fna.fbcdn.net/v/t1.6435-9/93111677_2784154918347411_516106016434159616_n.png?_nc_cat=105&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=-1Cacjd0sdgAX910iF5&_nc_ht=scontent.flad7-1.fna&oh=00_AfCCOeY596jwyIJtA7mWW_DtElyvlkAXVdF5kAqnVBTlAA&oe=642C7762",
       location: "Luanda"
  ),
  HighSchool(
      id: 3,
      name: "Simione Mucune",
     image: "https://images.unsplash.com/photo-1604134967494-8a9ed3adea0d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8c2Nob29sfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
     location: "Luanda"
  ),
  HighSchool(
      id: 4,
      name: "IMEL",
     image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8FhAJgybMkGY93BNfc4SfF01ffrOkFlajTg&usqp=CAU",
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
     image: "https://images.unsplash.com/photo-1454165804606-c3d57bc86b40?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aW5mb3JtYXRpY2ElMjBkZSUyMGdlc3QlQzMlQTNvfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
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
      image: "https://media.istockphoto.com/id/1388925357/pt/foto/the-statue-of-justice-lady-justice-or-iustitia-justitia-the-roman-goddess-of-justice.jpg?b=1&s=170667a&w=0&k=20&c=xCDIAdHZNnd-N4IYF1zViXhwx6BHIRCjwAYKLa8xRik=",
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




