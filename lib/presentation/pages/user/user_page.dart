import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("home"),
      ),
      body: Center(
        child: Text(
          "user-page",
          style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
