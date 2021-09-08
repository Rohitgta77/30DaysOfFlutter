import 'package:flutter/material.dart';
import 'package:snap_pe_merchant/constants/colorsConstants.dart';
import 'package:snap_pe_merchant/screens/chat/liveAgentScreen.dart';
import 'package:snap_pe_merchant/screens/payment/paymentScreen.dart';
import 'package:snap_pe_merchant/screens/profile/profileScreen.dart';
import 'package:snap_pe_merchant/utils/snapPeUI.dart';

import 'catalogue/catalogueScreen.dart';
import 'order/orderScreen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _screenIndex = 0;

  @override
  Widget build(BuildContext context) {
    var screens = [
      CatalogueScreen(),
      OrderScreen(),
      ProfileScreen(),
      LiveAgentScreen(),
      PaymentScreen(),
    ];

    return Scaffold(
      appBar: SnapPeUI().appBarSmall(),
      //drawer: Drawer(),
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
