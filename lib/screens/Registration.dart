import 'package:flutter/material.dart';
import 'package:flutter_catalog/utils/snapPeRoutes.dart';
import 'package:flutter_catalog/utils/snapPeUI.dart';

class Registration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SnapPeUI().AppBarBig(),
      body: Container(
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 50.0),
          child: Column(
            children: [
              Text(
                "Please enter your Details",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.name,
                maxLength: 50,
                decoration:
                    InputDecoration(hintText: "Enter Name", labelText: "Name"),
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                maxLength: 50,
                decoration: InputDecoration(
                    hintText: "Enter Email", labelText: "Email"),
              ),
              TextFormField(
                keyboardType: TextInputType.name,
                maxLength: 100,
                decoration: InputDecoration(
                    hintText: "Enter Organization Name",
                    labelText: "Organization Name"),
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                maxLength: 6,
                decoration: InputDecoration(
                    hintText: "Enter Pincode", labelText: "Pincode"),
              ),
              TextFormField(
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                    hintText: "Enter Password", labelText: "Password"),
              ),
              TextFormField(
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                    hintText: "Enter Confirm Password",
                    labelText: "Confirm Password"),
              ),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(Size(250, 40))),
                onPressed: () {
                  Navigator.pushNamed(context, SnapPeRoutes.homeRoute);
                },
                child: SnapPeUI().appBarText("Register", 15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
