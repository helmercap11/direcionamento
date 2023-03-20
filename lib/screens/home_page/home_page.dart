import 'dart:io';
import 'package:direcionamento/model/FieldStudyModel.dart';
import 'package:direcionamento/quiz_page/quiz_home.dart';
import 'package:direcionamento/screens/field_Study_details/field_study_details.dart';
import 'package:direcionamento/screens/root_app/root_app.dart';
import 'package:direcionamento/screens/school_page/school_page.dart';
import 'package:direcionamento/theme/global_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

import '../../utils/data.dart';

List<FieldStudyModel> fieldStudy = studyModel;

List<FieldStudyModel> selectedFieldStudy = [];



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {




  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Container(
        child: Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0),
          child: SafeArea(
            child: Container(
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  Container(
                    margin: EdgeInsets.all(9.0),
                    child:  Text(
                      "Escolha as áreas em que mais te destacas.",
                      style: TextStyle(
                          color: black,
                          fontSize: 20,
                          fontWeight: FontWeight.w400
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: studyModel.length,
                        itemBuilder: (BuildContext context, int index) {
                          final item = studyModel[index];
                        return Card(
                          margin: EdgeInsets.all(7.0),
                            elevation: 7.0,
                            child: FieldStudyItem(
                                studyModel[index].name,
                                studyModel[index].isSelected,
                                index
                            ),
                        );
                        }
                    ),
                  ),
            selectedFieldStudy.length > 0 ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10) ,
                    child: SizedBox(
                      width: double.infinity,
                      child: Container(
                        child: RaisedButton(
                            onPressed: (){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => SubjectForm()));
                            },
                          color: Colors.blue[700],
                          child: Text(
                            "Avançar(${selectedFieldStudy.length})",
                            style: TextStyle(
                              color: white,
                              fontSize: 18
                            ),
                          ),
                        ),
                      ),
                    ),
                  ):
                      Container(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


  Widget FieldStudyItem(String name, bool isSelected, int index){
    return ListTile(
        title: Text(
          name, style: TextStyle(
          color: black, fontWeight: FontWeight.w500,
            fontSize: 20
        ),
        ),
      trailing: isSelected
      ? Icon(Icons.check_circle, color: Colors.blue[700],)
      : Icon(Icons.check_circle_outline, color: Colors.grey ,),
      onTap: (){
          setState((){
            studyModel[index].isSelected = !studyModel[index].isSelected;
            if(studyModel[index].isSelected == true) {
              selectedFieldStudy.add(FieldStudyModel(name, true));
            } else if(studyModel[index].isSelected == false){
              selectedFieldStudy
                .removeWhere((element) => element.name == studyModel[index].name);
            }
          });
      },
    );
  }
}



class AllFilds extends FormBloc<String, String>{
  final text1 = TextFieldBloc();
  final engenharia = SelectFieldBloc(
      items: [
        'Informática',
        'Arquitetura',
        'Construção Cívil',
        'Eletronica de Telecomunicações',
        'Petroleo'
      ],
      validators: [FieldBlocValidators.required]
  );
  final multiSelect1 = MultiSelectFieldBloc<String, dynamic>(
      items: [
        'Informática',
        'Arquitetura',
        'Construção Cívil',
        'Eletronica de Telecomunicações',
        'Petroleo',
        'Mecatronica',
        'Ambiente'
      ]
  );

  final ciencia_exatas = MultiSelectFieldBloc<String, dynamic>(
      items: [
        'Física',
        'Matemática'
      ]
  );

  final ciencia_biologicas = MultiSelectFieldBloc<String, dynamic>(
      items: [
        'Anatomia Humana',
        'Biofísica',
        'Bioquímica',
        'Biotecnologia',
        'Citologia Animal e Vegetal',
        ' Ecologia',
        'Ecologia de Ecossistemas',
        'Educação Ambiental',
        'Evolução',
        'Fisiologia Humana',
        'Fisiologia Vegetal',
        'Genética',
        'Genética de Populações',
        'Impacto Ambiental',
        'Imunobiologia',
        'Microbiologia',
        'Paleontologia',
        'Parasitologia Humana',
        'Psicologia',
        'Sistemas Circulatório',
        'Sistemática Animal',
        'Sistema Vegetal e de Microrganismos',
        'Sociologia',
        'Zoologia de Invertebrados',
      ]
  );

  AllFilds(): super(autoValidate: false){
    addFieldBlocs(fieldBlocs: [
      text1,
      multiSelect1,
      engenharia,
      ciencia_exatas,
      ciencia_biologicas
    ]);
  }

  @override
  void onSubmitting() async {
    try {
      await Future<void>.delayed(const Duration(milliseconds: 500));
      emitSuccess(canSubmitAgain: true);
    } catch (e) {
      emitFailure();
    }
  }

}



class SubjectForm extends StatelessWidget {
  const SubjectForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>AllFilds(),
      child: Builder(
        builder: (context) {
          final formBloc = BlocProvider.of<AllFilds>(context);
          return Scaffold(
            appBar: AppBar(
              title: Text('Orientação Profissional'),
              backgroundColor: primary,
            ),
            floatingActionButton: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FloatingActionButton.extended(
                  heroTag: null, foregroundColor: primary,
                  //onPressed: formBloc.submit,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>QuizHome()));
                  },
                  icon: Icon(Icons.save, color: white,),
                  label: Text('Guargar Dados',style: TextStyle(color: white),),
                )
              ],
            ),
            body: Theme(
              data: Theme.of(context).copyWith(
                  inputDecorationTheme: InputDecorationTheme(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                      )
                  )
              ),
              child: FormBlocListener<AllFilds, String, String>(
                child: ScrollableFormBlocManager(
                  formBloc: formBloc,
                  child: SingleChildScrollView(
                    physics: ClampingScrollPhysics(),
                    padding: EdgeInsets.all(24.0),
                    child: Column(
                      children: [
                        Text(
                          "Escolha o curso da respetiva área de conhecimento.",
                          style: TextStyle(
                              color: black,
                              fontSize: 20,
                              fontWeight: FontWeight.w400
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(height: 20,),
                        CheckboxGroupFieldBlocBuilder<String>(
                          multiSelectFieldBloc: formBloc.ciencia_exatas,
                          itemBuilder: (context, item) => FieldItem(
                              child: Text(item)
                          ),
                          decoration: InputDecoration(
                              labelText: ('Ciências Exatas'),
                              prefixIcon: SizedBox(),
                              labelStyle: TextStyle(fontSize: 20, color: black, fontWeight: FontWeight.w900)
                          ),
                        ),
                        SizedBox(height: 15,),
                        CheckboxGroupFieldBlocBuilder<String>(
                          multiSelectFieldBloc: formBloc.ciencia_biologicas,
                          itemBuilder: (context, item) => FieldItem(
                              child: Text(item)
                          ),
                          decoration: InputDecoration(
                              labelText: 'Ciências Biológicas',
                              prefixIcon: SizedBox(),
                              labelStyle: TextStyle(fontSize: 20, color: black, fontWeight: FontWeight.w900)
                          ),
                        ),
                        SizedBox(height: 15,),
                        CheckboxGroupFieldBlocBuilder<String>(
                          multiSelectFieldBloc: formBloc.multiSelect1,
                          itemBuilder: (context, item) => FieldItem(
                            child: Text(
                              item, style: TextStyle(color: black),

                            ),
                          ),
                          decoration: const InputDecoration(
                            labelStyle: TextStyle(fontSize: 25, color: black, fontWeight: FontWeight.bold,),
                            labelText: 'Engenharia',
                            prefixIcon: SizedBox(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}


