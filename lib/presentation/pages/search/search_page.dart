import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("home"),
      ),
      body: Center(
        child: Text(
          "search-page",
          style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
