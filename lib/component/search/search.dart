import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search',
          prefixIcon: Icon(Icons.search),
          labelStyle: TextStyle(color: Colors.black),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromRGBO(225, 225, 225, 1),
            ),
            borderRadius: BorderRadius.horizontal(
              left: Radius.circular(25),
            ),
          ),
        ),
      ),
    );
  }
}
