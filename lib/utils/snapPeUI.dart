import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:snap_pe_merchant/constants/colorsConstants.dart';

class SnapPeUI {
  AppBar appBarBig() {
    return AppBar(
      toolbarHeight: 200,
      title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            appBarText("Snap Pe", 30),
            appBarSubText("~ Your New Wow ~", 15),
          ]),
      centerTitle: true,
      backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: kPrimaryColor),
    );
  }

  AppBar appBarSmall() {
    return AppBar(
      textTheme: TextTheme(),
      toolbarHeight: 80,
      title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            appBarText("Snap Pe", 22),
            appBarSubText("~ Your New Wow ~", 15),
          ]),
      centerTitle: true,
    );
  }

  // actions: [
  //   PopupMenuButton(
  //     itemBuilder: (context) {
  //       return [
  //         PopupMenuItem(child: Text("Profile")),
  //         PopupMenuItem(child: Text("Logout"))
  //       ];
  //     },
  //   ),
  // ],

  AppBar nAppBar(String mtitle) {
    return AppBar(
      title: appBarText(mtitle, 22),
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: kPrimaryColor),
    );
  }

  Text appBarText(String mtitle, double fsize) {
    return Text(
      mtitle,
      style: TextStyle(
          fontSize: fsize,
          fontWeight: FontWeight.bold,
          color: kPrimaryTextColor),
    );
  }

  Text appBarSubText(String mtitle, double fsize) {
    return Text(
      mtitle,
      style: TextStyle(
          fontSize: fsize,
          fontWeight: FontWeight.normal,
          color: kPrimaryTextColor),
    );
  }

  headingSubheadingText(String heading, String subHeading) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            heading,
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: kSecondayTextcolor),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            subHeading,
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w300,
                color: kSecondayTextcolor),
          ),
        ]);
  }

  customButtomNavigation() {
    return [
      BottomNavigationBarItem(
        icon: Icon(Icons.category),
        label: "Catalogue",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.outbox_rounded),
        label: "Orders",
      ),
      // BottomNavigationBarItem(
      //   icon: Icon(Icons.chat),
      //   label: "Live Agent",
      // ),
      // BottomNavigationBarItem(
      //   icon: Icon(Icons.payment),
      //   label: "Payment",
      // ),
      BottomNavigationBarItem(
        icon: Icon(Icons.account_box),
        label: "Account",
      ),
    ];
  }

  // Stack _buildBody() {
  //   return Stack(
  //     children: [
  //       Container(
  //         width: double.infinity,
  //         height: 200,
  //         decoration: BoxDecoration(
  //           gradient: LinearGradient(
  //             begin: Alignment.topCenter,
  //             end: Alignment.bottomCenter,
  //             colors: [Color(0xFFFFA000), Color(0xFFFFB300), Color(0xFFFFA000)],
  //           ),
  //           borderRadius: BorderRadius.only(
  //             bottomLeft: Radius.circular(30),
  //             bottomRight: Radius.circular(30),
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  toastError({String errorMessage = "Something went wrong."}) {
    Fluttertoast.showToast(
        msg: errorMessage,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  toastSuccess({String successMessage = "Operation Successfully performed."}) {
    Fluttertoast.showToast(
        msg: successMessage,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
