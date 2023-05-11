import 'package:direcionamento/controllers/user_controller.dart';
import 'package:direcionamento/model/nivel_academico_model.dart';
import 'package:direcionamento/model/user_model.dart';
import 'package:direcionamento/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../provider/nivel_academico_provider.dart';



class RegisterCre extends StatefulWidget {
  const RegisterCre({Key? key}) : super(key: key);

  @override
  State<RegisterCre> createState() => _RegisterCreState();
}

class _RegisterCreState extends State<RegisterCre> {





  GlobalKey<FormState> _addFormKey = GlobalKey<FormState>();
  final TextEditingController  _nameController = TextEditingController();
  late  TextEditingController  _emailController = TextEditingController();
  final TextEditingController  _senhaController = TextEditingController();
  final TextEditingController  _idnivelController = TextEditingController();

  final UserController api = UserController();


  String? dropdownvalue;

  final TextEditingController _controller = TextEditingController();



 UserProvider provider = UserProvider();

  UserController userController = UserController();

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

    return  Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Add Cases'),
      ),
      body: Form(
        key: _addFormKey,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Card(
                child: Container(
                    padding: EdgeInsets.all(10.0),
                    width: 440,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          controller: _nameController,
                          //initialValue:  widget.name,
                          decoration: const InputDecoration(hintText: 'nome'),

                        ),

                        TextFormField(
                          controller: _emailController,
                          decoration: const InputDecoration(hintText: 'email'),

                        ),
                        TextFormField(
                          controller: _senhaController,
                          decoration: const InputDecoration(hintText: 'ssenha'),
                          onChanged: (newValue) => _senhaController.text,
                        ),
                        TextFormField(
                          controller: _idnivelController,
                          decoration: const InputDecoration(hintText: 'id'),

                        ),
                       // _dropDownCategories(userController.nivel),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                             // api.createUser(_nameController.text, _emailController.text, _senhaController.text, _idnivelController.text);
                              provider.createUser(_nameController.text, _emailController.text, _senhaController.text, "1a10fc62-0629-46e1-b9db-0e7c2d04ecf3");
                            });
                          },
                          child: const Text('Create Data'),
                        ),
                      ],
                      /*children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Text('Nome'),
                              TextFormField(
                                autofocus: true,
                                controller: _nameController,
                                decoration: const InputDecoration(
                                  hintText: 'Full Name',
                                ),

                              ),
                            ],
                          ),
                        ),

                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Text('Email'),
                              TextFormField(
                                autofocus: true,
                                controller: _emailController,
                                decoration: const InputDecoration(
                                  hintText: 'Email',
                                ),
                                keyboardType: TextInputType.emailAddress,

                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Text('Senha'),
                              TextFormField(
                                autofocus:  true,
                                controller: _senhaController,
                                decoration: const InputDecoration(
                                  hintText: 'Senha',
                                ),

                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Text('City'),
                              TextFormField(
                                autofocus:  true,
                                controller: _idnivelController,
                                decoration: const InputDecoration(
                                  hintText: 'City',
                                ),

                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),


                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              RaisedButton(
                                splashColor: Colors.red,
                                onPressed: () {
                                  /*setState((){
                                    api.createUser(_nameController.text, _emailController.text, _senhaController.text, _idnivelController.text);

                                    Navigator.pop(context) ;
                                  });*/
                                 if (_addFormKey.currentState!.validate()) {
                                    _addFormKey.currentState!.save();
                                    api.createUser(_nameController.text, _emailController.text, _senhaController.text, _idnivelController.text);
                                    Navigator.pop(context) ;
                                  } else {
                                    Text("Erro");
                                  }
                                },
                                child: Text('Save', style: TextStyle(color: Colors.white)),
                                color: Colors.blue,
                              )
                            ],
                          ),
                        ),
                      ],*/
                    )
                )
            ),
          ),
        ),
      ),
    );
  }



  Widget _dropDownCategories(List<NivelAcademicoModel> categories) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Material(
        elevation: 2,
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "Categorias",
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
                      "Selecionar categoria",
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
          ),
        ),
      ),
    );
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


}
