import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/constants/colorsConstants.dart';
import 'package:flutter_catalog/helper/demodb.dart';
import 'package:flutter_catalog/utils/snapPeNetworks.dart';
import 'package:flutter_catalog/utils/snapPeRoutes.dart';
import 'package:flutter_catalog/utils/snapPeUI.dart';
import 'package:flutter_catalog/utils/snapPeUtil.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String name = "sdf";
  @override
  initState() {
    super.initState();
    //name = SnapPeUtils().getClientGroupName() as String?;
  }

  @override
  Widget build(BuildContext context) {
    _btnLogout() async {
      SnapPeNetworks().logOut();
      Navigator.pushNamedAndRemoveUntil(
          context, SnapPeRoutes.loginRoute, (route) => false);
    }

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FutureBuilder(
            future: SnapPeUtils().getClientGroupName(),
            builder: (context, snapshot) {
              return Text(
                "Client Group Name - ${snapshot.data}",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: kSecondayTextcolor),
              );
            },
          ),
          Center(
            child: ElevatedButton(
              child: SnapPeUI().appBarText("Logout", 15),
              onPressed: _btnLogout,
              style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(Size(250, 40))),
            ),
          ),
        ],
      ),
    );
  }
}
