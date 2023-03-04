import 'dart:io';
import 'package:direcionamento/widgets/custom_all.dart';
import 'package:flutter/material.dart';

class AllTab extends StatefulWidget {
  const AllTab({Key? key}) : super(key: key);

  @override
  State<AllTab> createState() => _AllTabState();
}

class _AllTabState extends State<AllTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text("Novos Topicos", style: TextStyle(fontSize: 20, color: Colors.grey),),
            ),
            CustomAll()
          ],
        ),
      ),
    );
  }
}
