import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("home"),
      ),
      body: Center(
        child: Text(
          "category_page",
          style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
