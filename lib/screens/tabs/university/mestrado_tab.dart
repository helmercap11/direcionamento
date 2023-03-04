import 'dart:io';
import 'package:direcionamento/widgets/custom_curso.dart';
import 'package:flutter/material.dart';


class MestradoTab extends StatefulWidget {
  const MestradoTab({Key? key}) : super(key: key);

  @override
  State<MestradoTab> createState() => _MestradoTabState();
}

class _MestradoTabState extends State<MestradoTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text("Cursos de Mestrado", style: TextStyle(fontSize: 20, color: Colors.grey),),
            ),
            CustomCurso()
          ],
        ),
      ),
    );
  }
}
