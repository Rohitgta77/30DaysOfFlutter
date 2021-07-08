import 'package:flutter/material.dart';
import 'package:flutter_catalog/utils/routes.dart';

class LogIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appTitles = "Login";

    return Material(
      color: Colors.white,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 50),
              Center(
                child: Image.asset(
                  "assets/images/snappe.png",
                  width: 120,
                  height: 120,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Text(
                  "Sign In / Sign Up",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Text(
                  "Hi there! Nice to see you again.",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 32),
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          hintText: "Enter Phone Number", labelText: "Phone"),
                    ),
                    SizedBox(height: 30),
                    ElevatedButton(
                      style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all(Size(250, 40))),
                      onPressed: () {
                        Navigator.pushNamed(context, MyRoutes.homeRoute);
                      },
                      child: Text(
                        "Get OTP",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      "Have an Password ?",
                    ),
                    TextButton(onPressed: () {}, child: Text("Sign In")),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
