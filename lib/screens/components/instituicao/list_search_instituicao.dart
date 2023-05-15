import 'package:flutter/material.dart';


class ListSearchInstituicao extends StatefulWidget {
  final void Function(String)? onChanged;
  final String? hintText;
  const ListSearchInstituicao({Key? key, this.onChanged, this.hintText}) : super(key: key);

  @override
  State<ListSearchInstituicao> createState() => _ListSearchInstituicaoState();
}

class _ListSearchInstituicaoState extends State<ListSearchInstituicao> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextField(
        autofocus: false,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
            border: const OutlineInputBorder(),
            prefixIcon: const Icon(Icons.search),
            hintText: widget.hintText
        ),
      ),
    );
  }
}
