import 'dart:collection';

import 'package:direcionamento/controllers/areaconhecimento_controller.dart';
import 'package:direcionamento/controllers/user_controller.dart';
import 'package:direcionamento/model/user_model.dart';
import 'package:direcionamento/provider/nivel_academico_provider.dart';
import 'package:direcionamento/provider/user_provider.dart';
import 'package:direcionamento/screens/acess_page/confirm_user_page.dart';
import 'package:direcionamento/theme/global_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
//import 'package:orientacao/screens/widgets/custom_dialog_sucess.dart';

import '../../model/nivel_academico_model.dart';
import '../home_page/home_page.dart';

import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class RegisterUser extends StatelessWidget {
  const RegisterUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RegisterPage(),
    );
  }
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final UserProvider userProvider = UserProvider();
 final UserController userController = UserController();
 final _addFormkey = GlobalKey<FormState>();
 final TextEditingController _controllername = TextEditingController();
 final TextEditingController _controlleremail = TextEditingController();
 final TextEditingController _controllersenha = TextEditingController();
 final TextEditingController _controller = TextEditingController();

 NivelAcademicoProvider _academicoProvider = NivelAcademicoProvider();

 List<DropdownMenuItem<String>> _dropDownItems(List<NivelAcademicoModel> categories) {
   List<DropdownMenuItem<String>> list = [];

   categories.forEach((category) {
     list.add(
         DropdownMenuItem(child: Text(category.descricao), value: category.id));
   });

   return list;
 }
 void refresh() {
   setState(() {});
 }


 int _currentStep = 0;

  _stepState(int step) {
    if (_currentStep > step) {
      return StepState.complete;
    } else {
      return StepState.editing;
    }
  }

  _steps() => [
        Step(
          title: const Text('Conta'),
          content:  _Account(),
          state: _stepState(0),
          isActive: _currentStep == 0,
        ),
        Step(
          title: const Text('Dados Pessoais'),
          content: _DataAccount(),
          state: _stepState(1),
          isActive: _currentStep == 1,
        ),
        Step(
          title: const Text('Finalizar'),
          content: _FinnalyAccount(),
          state: _stepState(2),
        )
      ];



  void _save() async {

    try {
      final user = await userProvider.createUser(_controllername.text, _controlleremail.text, _controllersenha.text, userController.idnivelacademico.toString());
      Navigator.push(context, MaterialPageRoute(builder: (context) => ConfirmatioAcount()));
      if (user != null) {
        var customerInfo = userController;
        await customerInfo.emailcontroller == _controlleremail.text;
        print("erro");
        /*.push(
            context,
            MaterialPageRoute(
                builder: (context) => CustomerScreen(
                    customerInfo: customerInfo)))*/

      } else {
        await showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Aviso!"),
              content: Text("Email or Password is wrong!"),
              actions: [
                ElevatedButton(
                  onPressed: () {Navigator.of(context).pop();},
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Aviso!"),
            content: Text("Aviso! Já existe um email cadastrado com esse nome"),
            actions: [
              ElevatedButton(
                onPressed: () {Navigator.of(context).pop();},
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    }

    /*userProvider.createUser(_controllername.text, _controlleremail.text, _controllersenha.text, userController.idnivelacademico.toString()).catchError((e) {
      showDialog(
          context: context,
          builder: (contextDialog) {
            return AlertDialog(
              title: const Text('Basic dialog title'),
              content: const Text('Falha'),
              /*actions: <Widget>[
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: Theme.of(context).textTheme.labelLarge,
                  ),
                  child: const Text('Disable'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: Theme.of(context).textTheme.labelLarge,
                  ),
                  child: const Text('Enable'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],*/
            );;
          });

    }, test: (e) => e is Exception);

    if (userProvider != null) {
      await showDialog(
          context: context,
          builder: (contextDialog) {
            return AlertDialog(
              title: const Text('sucesso'),
              content: const Text('sucesso'),
              /*actions: <Widget>[
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: Theme.of(context).textTheme.labelLarge,
                  ),
                  child: const Text('Disable'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: Theme.of(context).textTheme.labelLarge,
                  ),
                  child: const Text('Enable'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],*/
            );
          });
      Navigator.pop(context);
    }*/
  }



 @override
  void initState() {
   super.initState();
   SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
     userController.idnivelacademico;
     userController.init(context, refresh);
   });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Theme(
        data: Theme.of(context).copyWith(
            inputDecorationTheme: InputDecorationTheme(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)
                )
            )
        ), //key: _addFormKey,
        child: Container(
            child: Container(
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          primary,
                          primary
                        ])
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Container(
                            margin: EdgeInsets.only(top: 25,right: 330),
                            child: Column(
                              children: [
                                IconButton(onPressed: () =>Navigator.of(context).pop() ,
                                  icon: Icon(Icons.arrow_back,color: white,size: 30,),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(

                      padding: EdgeInsets.only(top: 100),

                      child: Container(
                        child:  ClipRRect(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(0.0),
                            topLeft: Radius.circular(85.0),
                          ),

                          child: Container(
                            child: Stepper(
                              type: StepperType.horizontal,
                              controlsBuilder: (BuildContext context, ControlsDetails controls) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                                  child: Row(
                                    children: <Widget>[
                                      _currentStep == 2 // this is the last step
                                          ?
                                      ElevatedButton(

                                        onPressed: () async{
                                          _save();
                                          },
                                        child: Text('SALVAR'),
                                      )
                                          : ElevatedButton(
                                        onPressed: controls.onStepContinue,
                                        child: Text('CONTINUE'),
                                      ),
                                      if (_currentStep != 0)
                                        TextButton(
                                          onPressed: controls.onStepCancel,
                                          child: const Text(
                                            'BACK',
                                            style: TextStyle(color: Colors.grey),
                                          ),
                                        ),
                                    ],
                                    /*children: <Widget>[
                                      ElevatedButton(
                                        onPressed: controls.onStepContinue,
                                        child:  Text('CONTINUE'),
                                      ),
                                      if (_currentStep != 0)
                                        TextButton(
                                          onPressed: controls.onStepCancel,
                                          child: const Text(
                                            'BACK',
                                            style: TextStyle(color: Colors.grey),
                                          ),
                                        ),
                                    ],*/
                                  ),
                                );
                              },
                             // onStepTapped: (step) => setState(() => _currentStep = step),
                                onStepTapped:(step){
                                  if(step>_currentStep){
                                    setState((){
                                      _currentStep=step;
                                    });
                                  }
                                },
                              onStepContinue: () {
                                setState(() {
                                  if (_currentStep < _steps().length - 1) {
                                    _currentStep += 1;
                                      } else {
                                    _currentStep = 0;
                                  }
                                });

                              },
                              onStepCancel: () {
                                setState(() {
                                  if (_currentStep > 0) {
                                    _currentStep -= 1;
                                  } else {
                                    _currentStep = 0;
                                  }
                                });
                              },
                              currentStep: _currentStep,
                              steps: _steps(),
                            ),
                            height: MediaQuery.of(context).size.height/1.1,
                            width: MediaQuery.of(context).size.width,
                            color: white,
                          ),
                        ),
                      )
                  )
                ],
              ),
            ),

        ),
      ),
    );

  }

  Widget _Account() {
    return Column(
      children: [
        TextFormField(
          controller: _controllername,
          decoration: const InputDecoration(
            labelText: 'Primerio Nome',
            prefixIcon: Icon(Icons.person),
          ),

        ),
        SizedBox(height: 20),
        TextFormField(
          controller: _controller,
          decoration: const InputDecoration(
            labelText: 'Ultimo nome',
            prefixIcon: Icon(Icons.person),
          ),

        ),
        SizedBox(height: 20),
        TextFormField(
          controller: _controlleremail,
          decoration: const InputDecoration(
            labelText: 'Email',
            prefixIcon: Icon(Icons.email),
          ),
        ),
        SizedBox(height: 20),
        TextFormField(
          controller:  _controllersenha,
          decoration: const InputDecoration(
            labelText: 'Senha',
            prefixIcon: Icon(Icons.lock),
          ),
        ),
        ElevatedButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> ConfirmUser()));
          },
          child: Text('Teste'),
        ),
      ],
    );
}

Widget _DataAccount(){
  var gender;
  return Column(
    children: [
      Column(
        children: [

          Text("Genero", style: TextStyle(
              fontSize: 18
          ),),

          Divider(),

          RadioListTile(
            title: Text("Male"),
            value: "male",
            groupValue: gender,
            onChanged: (value){

            },
          ),

          RadioListTile(
            title: Text("Female"),
            value: "female",
            groupValue: gender,
            onChanged: (value){

            },
          ),


        ],
      ),
      SizedBox(height: 20),
      TextField(
        decoration: InputDecoration(
            icon: Icon(Icons.calendar_today), //icon of text field
            labelText: "Enter Date" //label text of field
        ),
        readOnly: true,  //set it true, so that user will not able to edit text
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
              context: context, initialDate: DateTime.now(),
              firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
              lastDate: DateTime(2101)
          );

          if(pickedDate != null ){
            print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
            String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
            print(formattedDate); //formatted date output using intl package =>  2021-03-16
            //you can implement different kind of Date Format here according to your requirement

            /*setState(() {
                dateinput.text = formattedDate; //set output date to TextField value.
              });*/
          }else{
            print("Date is not selected");
          }
        },
      ),




      SizedBox(height: 20),

    ],
  );
}

Widget _FinnalyAccount() {
  return Column(
    children: [
     _dropDownCategories(userController.nivel),
      SizedBox(height: 20),
      TextFormField(
        decoration: const InputDecoration(
          labelText: 'Ultimo nome',
          prefixIcon: Icon(Icons.person),
        ),

      ),
      SizedBox(height: 20),
      TextFormField(
        decoration: const InputDecoration(
          labelText: 'Email',
          prefixIcon: Icon(Icons.email),
        ),
      ),
      SizedBox(height: 20),
      TextFormField(

        decoration: const InputDecoration(
          labelText: 'Senha',
          prefixIcon: Icon(Icons.lock),
        ),
      ),

    ],
  );
}

 Widget _dropDownCategories(List<NivelAcademicoModel> categories) {
   return Column(
     children: [
       Row(
         children: [
           SizedBox(
             width: 15,
           ),
           Text(
             "Selecione Nivel Academico",
             style: TextStyle(
               color: Colors.grey,
             ),
           )
         ],
       ),
       Container(
         padding: EdgeInsets.symmetric(horizontal: 20),
         child: DropdownButton(
             underline: Container(
               alignment: Alignment.centerRight,
               child: Icon(
                 Icons.arrow_drop_down_circle,
                 color: Colors.blue,
               ),
             ),
             elevation: 3,
             isExpanded: true,
             hint: Text(
               "Selecionar o nivel academico",
               style: TextStyle(
                 color: Colors.grey,
                 fontSize: 16,
               ),
             ),
             items: _dropDownItems(categories),
             value: userController.idnivelacademico,
             onChanged: (String? option) {
               setState(() {
                 userController.idnivelacademico = option!;
               });
             }),
       )
     ],
   );
 }

 Widget ConfirmatioAcount(){
    return Container(
      color: white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),

              child: Center(child: Icon(Icons.check_circle_outline_sharp, size: 200,color: blue,)),
            ),
            SizedBox(height: 10,),
            Text(
              "Bem Vindo.",
              style: TextStyle(fontSize: 30, color: black, decoration: TextDecoration.none),
            ),
            SizedBox(height: 15,),
            Text(
              "Estamos aqui para ajudar na sua Orientação Profissional! A seguir será apresentado algumas áreas de conhecimento.",
              style: TextStyle(fontSize: 20, color: Colors.black38, decoration: TextDecoration.none),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 40,),
            Padding(padding: EdgeInsets.only(top: 60),
                child:  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: blue,
                      onPrimary: Colors.white,
                      shadowColor: blue,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                      minimumSize: Size(300, 50), //////// HERE
                    ),
                    child: Text(
                      'Continuar',
                      style: TextStyle(fontSize: 20,),
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                    }
                )

            ),
          ],
        ),
      ),
    );;
 }

}

class WellCome extends StatefulWidget {
  const WellCome({Key? key}) : super(key: key);

  @override
  State<WellCome> createState() => _WellComeState();
}

class _WellComeState extends State<WellCome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),

              child: Center(child: Icon(Icons.check_circle_outline_sharp, size: 200,color: blue,)),
            ),
            SizedBox(height: 10,),
            Text(
              "Bem Vindo.",
              style: TextStyle(fontSize: 30, color: black, decoration: TextDecoration.none),
            ),
            SizedBox(height: 15,),
            Text(
              "Estamos aqui para ajudar na sua Orientação Profissional! A seguir será apresentado algumas áreas de conhecimento.",
              style: TextStyle(fontSize: 20, color: Colors.black38, decoration: TextDecoration.none),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 40,),
            Padding(padding: EdgeInsets.only(top: 60),
                child:  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: blue,
                      onPrimary: Colors.white,
                      shadowColor: blue,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                      minimumSize: Size(300, 50), //////// HERE
                    ),
                    child: Text(
                      'Continuar',
                      style: TextStyle(fontSize: 20,),
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                    }
                )

            ),
          ],
        ),
      ),
    );
  }
}






/*
class RegisterFormBloc extends FormBloc<String, String> {


  final username = TextFieldBloc(
    validators: [FieldBlocValidators.required],

  );

  final email = TextFieldBloc<String>(
    validators: [
      FieldBlocValidators.required,
      FieldBlocValidators.email,
    ],
  );

  final password = TextFieldBloc(
    validators: [
      FieldBlocValidators.required,
      FieldBlocValidators.passwordMin6Chars,
    ],
  );

  final firstName = TextFieldBloc();

  final lastName = TextFieldBloc();

  final gender = SelectFieldBloc(
    items: ["1", "1"],
  );

  final birthDate = InputFieldBloc<DateTime?, Object>(
    initialValue: null,
    validators: [FieldBlocValidators.required],
  );

  final phone = TextFieldBloc();

  final nacionality = TextFieldBloc();

  final academic = TextFieldBloc();

  RegisterFormBloc() {
    addFieldBlocs(
      step: 0,
      fieldBlocs: [username, email, password],
    );
    addFieldBlocs(
      step: 1,
      fieldBlocs: [firstName, lastName, gender, birthDate],
    );
    addFieldBlocs(
      step: 2,
      fieldBlocs: [phone, nacionality, academic],
    );
  }

  bool _showEmailTakenError = true;

  @override
  void onSubmitting() async {
    if (state.currentStep == 0) {
      await Future.delayed(const Duration(milliseconds: 500));

      if (_showEmailTakenError) {
        _showEmailTakenError = false;

        email.addFieldError('Esse e-mail já foi usado');

        emitFailure();
      } else {
        emitSuccess();
      }
    } else if (state.currentStep == 1) {
      emitSuccess();
    } else if (state.currentStep == 2) {
      await Future.delayed(const Duration(milliseconds: 500));

      emitSuccess();
    }
  }


}

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final UserController userController =UserController();

  final _addFormKey = GlobalKey<FormState>();

  NivelAcademicoProvider nivelAcademicoProvider =  NivelAcademicoProvider();
  UserProvider userProvider = UserProvider();



  var _type = StepperType.horizontal;

 RegisterFormBloc regbloc = RegisterFormBloc();


  void _toggleType() {
    setState(() {
      if (_type == StepperType.horizontal) {
        _type = StepperType.vertical;
      } else {
        _type = StepperType.horizontal;
      }
    });
  }



  List<DropdownMenuItem<String>> _dropDownItems(List<NivelAcademicoModel> categories) {
    List<DropdownMenuItem<String>> list = [];
    categories.forEach((category) {
      list.add(
          DropdownMenuItem(child: Text(category.descricao), value: category.id));
    });

    return list;
  }
  void refresh() {
    setState(() {});
  }



  List<DropdownMenuItem<String>> get dropdownCountrs{
    List<DropdownMenuItem<String>> menuItems = [

      DropdownMenuItem(child: Text("Angola"),value: "Angola"),
      DropdownMenuItem(child: Text("Argentina"),value: "Argentina"),
      DropdownMenuItem(child: Text("Argelia"),value: "Argelia"),
      DropdownMenuItem(child: Text("Belgiga"),value: "Belgica"),
    ];
    return menuItems;
  }

  String selectedValue = "Técnico Médio";

  String selectedValueCountry = "Angola";






  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      userController.idnivelacademico='1';
      userController.init(context, refresh);
    });

  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider( key: _addFormKey,
      create: (context) => RegisterFormBloc(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: Theme(
              data: Theme.of(context).copyWith(
                  inputDecorationTheme: InputDecorationTheme(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                      )
                  )
              ), //key: _addFormKey,
              child: Container(
                child:FormBlocListener<RegisterFormBloc, String, String>(
                  onSubmitting: (context, state) => LoadingDialog.show(context),
                  onSubmissionFailed: (context, state) => LoadingDialog.hide(context),
                  onSuccess: (context, state) {
                    LoadingDialog.hide(context);

                    if (state.stepCompleted == state.lastStep) {
                      userProvider.createUser(regbloc.username.toString(), regbloc.email.toString(), regbloc.password.toString(), "a86d64d7-0a09-4dce-8b0b-7b7d7c204ec7");
                      /*Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (_) => const DialogInitial()));*/
                      //userController.createUser();
                      /*Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (_) => const DialogInitial()));*/
                    }
                  },
                  onFailure: (context, state) {
                    LoadingDialog.hide(context);
                  },
                  child: Container(
                    child: Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                primary,
                                primary
                              ])
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(20.0),
                                child: Container(
                                  margin: EdgeInsets.only(top: 25,right: 330),
                                  child: Column(
                                    children: [
                                      IconButton(onPressed: () =>Navigator.of(context).pop() ,
                                        icon: Icon(Icons.arrow_back,color: white,size: 30,),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(

                            padding: EdgeInsets.only(top: 100),

                            child: Container(
                              child:  ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(0.0),
                                  topLeft: Radius.circular(85.0),
                                ),

                                child: Container(
                                  child: StepperFormBlocBuilder<RegisterFormBloc>(

                                    formBloc: context.read<RegisterFormBloc>(),
                                    type: _type,

                                    physics: const ClampingScrollPhysics(),
                                    stepsBuilder: (formBloc) {

                                      return [
                                        _accountStep(formBloc!),
                                        _personalStep(formBloc),
                                        _socialStep(formBloc),
                                      ];
                                    },
                                  ),
                                  height: MediaQuery.of(context).size.height/1.1,
                                  width: MediaQuery.of(context).size.width,
                                  color: white,
                                ),
                              ),
                            )
                        )
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

  FormBlocStep _accountStep(RegisterFormBloc wizardFormBloc) {
    return FormBlocStep(
      title: const Text('Conta'),
      content: Column(
        children: <Widget>[
          TextFieldBlocBuilder(
            textFieldBloc: wizardFormBloc.username,
            keyboardType: TextInputType.name,
            enableOnlyWhenFormBlocCanSubmit: true,
            decoration: const InputDecoration(
              labelText: 'Nome de Usuário',
              prefixIcon: Icon(Icons.person),
            ),
          ),
          TextFieldBlocBuilder(
            textFieldBloc: wizardFormBloc.email,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              labelText: 'Email',
              prefixIcon: Icon(Icons.email),
            ),
          ),
          TextFieldBlocBuilder(
            textFieldBloc: wizardFormBloc.password,
            keyboardType: TextInputType.emailAddress,
            suffixButton: SuffixButton.obscureText,
            decoration: const InputDecoration(
              labelText: 'Palavra Passe',
              prefixIcon: Icon(Icons.lock),
            ),
          ),
          /*RaisedButton(
            padding: EdgeInsets.all(0.0),
            onPressed: (){  Navigator.push(context,
                MaterialPageRoute(builder: (context) => WellCome()));
              /*showDialog(
                  context: context,
                  builder: (BuildContext context) => CustomSucessDialog(
                      title: "Sucesso",
                      //description: "testando o aplicativo",
                      buttonText: "Terminar")
              );*/
            },
            textColor: white,
            color: primary,
            child: Text("Open Dialog"),
          ),*/
        ],
      ),
    );
  }

  FormBlocStep _personalStep(RegisterFormBloc wizardFormBloc) {
    return FormBlocStep(
      title: const Text('Dados Pessoais'),
      content: Column(
        children: <Widget>[
          TextFieldBlocBuilder(
            textFieldBloc: wizardFormBloc.firstName,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              labelText: 'Primeiro Nome',
              prefixIcon: Icon(Icons.person),
            ),
          ),
          TextFieldBlocBuilder(
            textFieldBloc: wizardFormBloc.lastName,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              labelText: 'Último Nome',
              prefixIcon: Icon(Icons.person),
            ),
          ),
          RadioButtonGroupFieldBlocBuilder<String>(
            selectFieldBloc: wizardFormBloc.gender,
            itemBuilder: (context, value) => FieldItem(
              child: Text(value),
            ),
            decoration: const InputDecoration(
              labelText: 'Gênero',
              prefixIcon: SizedBox(),
            ),
          ),
          DateTimeFieldBlocBuilder(
            dateTimeFieldBloc: wizardFormBloc.birthDate,
            firstDate: DateTime(1900),
            initialDate: DateTime.now(),
            lastDate: DateTime.now(),
            format: DateFormat('yyyy-MM-dd'),
            decoration: const InputDecoration(
              labelText: 'Data de Nascimento',
              prefixIcon: Icon(Icons.cake),
            ),
          ),
        ],
      ),
    );
  }

  FormBlocStep _socialStep(RegisterFormBloc wizardFormBloc) {
    return FormBlocStep(
      title: const Text('Finalizar'),
      content: Column(
        children: <Widget>[
          TextFieldBlocBuilder(
            textFieldBloc: wizardFormBloc.phone,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Telefone',
              prefixIcon: Icon(Icons.phone),
            ),
          ),
          SizedBox(height: 20,),
          DropdownButtonFormField(
            decoration: InputDecoration(
                labelText: 'País de Nacionalidade',
                prefixIcon: Icon(Icons.flag_outlined)
            ),
            value: selectedValueCountry,
            items: dropdownCountrs,
            onChanged: (String){},
          ),SizedBox(height: 20,),
          //_dropDownCategories(userController.nivel)
        ],
      ),
    );
  }
// adicionar aqui
  Widget _dropDownCategories(List<NivelAcademicoModel> nivel) {
   //userController.idnivelacademico;
    return Container(
        child: Column(
          children: [
            DropdownButtonFormField(
              decoration: InputDecoration(
                  hintText:  'Nível Academico' ,
                  prefixIcon: Icon(Icons.school)
              ),

              items: _dropDownItems(nivel),
              value:  userController.idnivelacademico,
              onChanged: (String ? newValue){
                setState(() {
                  userController.idnivelacademico = newValue!;

                });
              },
            ),
          ],
        )
    );
  }
}

class LoadingDialog extends StatelessWidget {
  static void show(BuildContext context, {Key? key}) => showDialog<void>(
    context: context,
    useRootNavigator: false,
    barrierDismissible: false,
    builder: (_) => LoadingDialog(key: key),
  ).then((_) => FocusScope.of(context).requestFocus(FocusNode()));

  static void hide(BuildContext context) => Navigator.pop(context);

  const LoadingDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Center(
        child: Card(
          child: Container(
            width: 80,
            height: 80,
            padding: const EdgeInsets.all(12.0),
            child: const CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }


}

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(Icons.info_outline_rounded, size: 100, color: red,),
            const SizedBox(height: 10),
            const Text(
              'Clique em salvar dados',
              style: TextStyle(fontSize: 54, color: Colors.black),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: (){

              }, /*=> Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => CustomSucessDialog(
                      title: "Sucesso",
                      buttonText: "Finalizar"))),*/
              icon: const Icon(Icons.save),
              label: const Text('Salvar os dados'),
            ),
          ],
        ),
      ),
    );
  }
}


class DialogInitial extends StatefulWidget {
  const DialogInitial({Key? key}) : super(key: key);

  @override
  State<DialogInitial> createState() => _DialogInitialState();
}

class _DialogInitialState extends State<DialogInitial>
    with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<double> scaleAnimation;

  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(
        milliseconds: 1000,
      ),
      vsync: this,
      value: 0.1,
    );
    scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.bounceIn,
    );
    _controller.forward();
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ScaleTransition(
        scale: scaleAnimation,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(Icons.check, size: 100, color: Colors.green,),
            const SizedBox(height: 10),
            const Text(
              'Sucesso',
              style: TextStyle(fontSize: 54, color: Colors.black,decoration: TextDecoration.none),
              textAlign: TextAlign.center,

            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => const WellCome())),
              icon: const Icon(Icons.replay),
              label: const Text('FINALIZAR'),
            ),
          ],
        ),
      ),
    );
  }
}


class WellCome extends StatefulWidget {
  const WellCome({Key? key}) : super(key: key);

  @override
  State<WellCome> createState() => _WellComeState();
}

class _WellComeState extends State<WellCome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),

              child: Center(child: Icon(Icons.check_circle_outline_sharp, size: 200,color: blue,)),
            ),
            SizedBox(height: 10,),
            Text(
              "Bem Vindo.",
              style: TextStyle(fontSize: 30, color: black, decoration: TextDecoration.none),
            ),
            SizedBox(height: 15,),
            Text(
              "Estamos aqui para ajudar na sua Orientação Profissional! A seguir será apresentado algumas áreas de conhecimento.",
              style: TextStyle(fontSize: 20, color: Colors.black38, decoration: TextDecoration.none),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 40,),
            Padding(padding: EdgeInsets.only(top: 60),
                child:  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: blue,
                      onPrimary: Colors.white,
                      shadowColor: blue,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                      minimumSize: Size(300, 50), //////// HERE
                    ),
                    child: Text(
                      'Continuar',
                      style: TextStyle(fontSize: 20,),
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                    }
                )

            ),
          ],
        ),
      ),
    );
  }
}

*/