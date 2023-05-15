import 'package:flutter/material.dart';

import '../../../widgets/custom_curso.dart';



class LicenciaturaTab extends StatefulWidget {
  const LicenciaturaTab({Key? key}) : super(key: key);

  @override
  State<LicenciaturaTab> createState() => _LicenciaturaTabState();
}

class _LicenciaturaTabState extends State<LicenciaturaTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text("Cursos Licenciatura", style: TextStyle(fontSize: 20, color: Colors.grey),),
            ),
            CustomCurso()
          ],
        ),
      ),
    );
  }
}
