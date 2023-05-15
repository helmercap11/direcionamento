import 'package:direcionamento/controllers/instituicao_controller.dart';
import 'package:direcionamento/model/instituicao_model.dart';
import 'package:direcionamento/screens/components/instituicao/instituicao_list.dart';
import 'package:direcionamento/screens/components/instituicao/list_search_instituicao.dart';
import 'package:direcionamento/widgets/bottomNavigationBar.dart';
import 'package:direcionamento/widgets/custom_bottomNavigationBar.dart';
import 'package:flutter/material.dart';

import '../../theme/global_color.dart';
import '../components/loading.dart';


class SearchInstituicao extends StatefulWidget {
  const SearchInstituicao({Key? key}) : super(key: key);

  @override
  State<SearchInstituicao> createState() => _SearchInstituicaoState();
}

class _SearchInstituicaoState extends State<SearchInstituicao> {

  InstituicaoController _controller = InstituicaoController();
  final List<InstituicaoModel> _listAreaModel = <InstituicaoModel>[];
  List<InstituicaoModel> _listAreaDisplay = <InstituicaoModel>[];


  bool _isLoading = true;


  @override
  void initState() {
    super.initState();
    _controller.fetchInstituicao().then((value) {
      setState((){
        _isLoading = false;
        _listAreaModel.addAll(value);
        _listAreaDisplay = _listAreaModel;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        title: const Text("Orientação Profissional"),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(

        child: Container(
            height: double.infinity,
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 10,bottom: 83),
                  height: MediaQuery.of(context).size.height,
                  width: double.infinity,
                  child: ListView.builder(
                    itemBuilder: (context, index) {

                      if (!_isLoading) {
                        return index == 0
                            ? ListSearchInstituicao(
                          hintText: 'Pesquisar Instituição de Ensino.',
                          onChanged: (searchText) {
                            searchText = searchText.toLowerCase();
                            setState(() {
                              _listAreaDisplay = _listAreaModel.where((u) {
                                var nameLowerCase = u.location.toLowerCase();
                                return nameLowerCase.contains(searchText);

                              }).toList();
                            });
                          },
                        )
                            : InstituicaoList(instituicaoModel: _listAreaDisplay[index - 1]);
                      } else {
                        return const MyLoading();
                      }
                    },
                    itemCount: _listAreaDisplay.length +1,
                  ),
                )
              ],
            ),
          )
        )
      ),
      bottomNavigationBar: BootomNavigationBar(),
    );
  }
}
