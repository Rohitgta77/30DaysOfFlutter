import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int part = 10;
    String name = "Fd";
    double price = 3.14;
    bool isChecked = true;
    num temp = 30.5; //30 or 30.5
    var data = "Tuesday";
    const pi = 3.14;
    final list = ["sd"];
    var appTitles = "Awesome App";

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.ac_unit),
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          onPressed: () {},
        ),
        title: Text(appTitles),      
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.headphones)),
          IconButton(onPressed: () {}, icon: Icon(Icons.access_alarm_rounded)),
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(child: Text("Profile")),
                PopupMenuItem(child: Text("Wallets")),
                PopupMenuItem(child: Text("Setting"))
              ];
            },
          ),
        ],
      ),
    );
  }
}
