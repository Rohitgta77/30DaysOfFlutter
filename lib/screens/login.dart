import 'package:flutter/material.dart';

class LogIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appTitles = "Login";

    return Material(
      color: Colors.white,
      child: Column(
        children: [
          Image.asset(
            "assets/images/login.png",
          ),
          Text(
            "Welcome",
            style: TextStyle(
              fontSize: 24,
            ),
          )
        ],
      ),
    );
  }
}
