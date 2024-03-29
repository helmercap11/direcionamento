import 'package:flutter/material.dart';


class SearchAreaConhecimento extends StatefulWidget {
  final void Function(String)? onChanged;
  final String? hintText;
  const SearchAreaConhecimento({Key ? key, this.onChanged, this.hintText}) : super(key: key);

  @override
  State<SearchAreaConhecimento> createState() => _SearchAreaConhecimentoState();
}

class _SearchAreaConhecimentoState extends State<SearchAreaConhecimento> {
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
