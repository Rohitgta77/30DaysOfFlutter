import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/constants/colorsConstants.dart';
import 'package:flutter_catalog/models/catalogueModel.dart';
import 'package:flutter_catalog/screens/liveAgentScreen.dart';
import 'package:flutter_catalog/screens/orderScreen.dart';
import 'package:flutter_catalog/screens/paymentScreen.dart';
import 'package:flutter_catalog/screens/profileScreen.dart';
import 'package:flutter_catalog/utils/snapPeUI.dart';

import 'catalogueScreen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _screenIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screens = [
      CatalogueScreen(),
      OrderScreen(),
      LiveAgentScreen(),
      PaymentScreen(),
      ProfileScreen(),
    ];

    return Scaffold(
      appBar: SnapPeUI().AppBarSmall(),
      drawer: Drawer(),
      body: screens[_screenIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _screenIndex,
        unselectedItemColor: Colors.grey,
        selectedItemColor: kPrimaryColor,
        selectedFontSize: 15,
        iconSize: 28,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        onTap: (value) => {
          setState(() {
            _screenIndex = value;
          })
        },
        items: SnapPeUI().customButtomNavigation(),
      ),
    );

    // WillPopScope(
    //   child:
    //   onWillPop: () async {
    //     exit(0);
    //   },
    // );
  }
}
