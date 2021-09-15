import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:snap_pe_merchant/constants/colorsConstants.dart';
import 'package:snap_pe_merchant/models/model_community.dart';
import 'package:snap_pe_merchant/models/model_consumer.dart';
import 'package:snap_pe_merchant/models/model_order_summary.dart';
import 'package:snap_pe_merchant/models/model_orders.dart';
import 'package:snap_pe_merchant/utils/snapPeNetworks.dart';
import 'package:snap_pe_merchant/screens/order/orderWidget.dart';
import 'package:snap_pe_merchant/utils/snapPeUI.dart';

import 'cart/screen_cart.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  List<Community> communities = [
    new Community(communityName: "sad"),
    new Community(communityName: "df")
  ];
  List<Order>? orders;
  String? _selectedCommunity;
  String? _chosenValue;
  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(margin: EdgeInsets.all(16), child: buildOrderView()),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.article,
          color: Colors.white,
        ),
        onPressed: () {
          createAlertDialog();
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => Order(skuItem: Sku())));
        },
      ),
    );
  }

  createAlertDialog() {
    final searchController = TextEditingController();
    return showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Select Customer"),
          content: Container(
            height: 150,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TypeAheadField(
                    textFieldConfiguration: TextFieldConfiguration(
                        controller: searchController,
                        decoration:
                            InputDecoration(labelText: "Search customer")),
                    suggestionsCallback: (pattern) async {
                      return await SnapPeNetworks()
                          .customerSuggestionsCallback(pattern);
                    },
                    itemBuilder: (context, OrderSummaryModel customer) {
                      return ListTile(
                        title: Text("${customer.customerName}"),
                        subtitle: Text("${customer.customerNumber}"),
                      );
                    },
                    onSuggestionSelected: (OrderSummaryModel customer) {
                      print(customer.customerNumber);
                      //var json = customerModelToJson(customer);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CartScreen(order: customer),
                          ));
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "- - or - -",
                    style: TextStyle(color: kLightTextColor),
                  ),
                  MaterialButton(
                    child: Text("Create new Customer",
                        style: TextStyle(color: kLinkTextColor)),
                    onPressed: () async {
                      Navigator.pop(context);
                      newCustomerDialog();
                    },
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  newCustomerDialog() {
    final firstNameController = TextEditingController();
    final lastNameController = TextEditingController();
    final mobileController = TextEditingController();
    final companyController = TextEditingController();
    final pincodeController = TextEditingController();
    final fullAddressController = TextEditingController();

    return showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("New Customer"),
          content: StatefulBuilder(
            builder: (context, setState) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    TextFormField(
                      controller: firstNameController,
                      keyboardType: TextInputType.name,
                      maxLength: 50,
                      decoration: InputDecoration(
                          hintText: "Enter First Name",
                          labelText: "First Name"),
                    ),
                    TextFormField(
                      controller: lastNameController,
                      keyboardType: TextInputType.name,
                      maxLength: 50,
                      decoration: InputDecoration(
                          hintText: "Enter Last Name", labelText: "Last Name"),
                    ),
                    TextFormField(
                      controller: mobileController,
                      keyboardType: TextInputType.number,
                      maxLength: 10,
                      decoration: InputDecoration(
                          hintText: "Enter Mobile", labelText: "Mobile"),
                    ),
                    TextFormField(
                      controller: companyController,
                      keyboardType: TextInputType.name,
                      maxLength: 100,
                      decoration: InputDecoration(
                          hintText: "Enter Company Name", labelText: "Company"),
                    ),
                    DropdownButton<String>(
                      value: _selectedCommunity,
                      iconSize: 25,
                      elevation: 16,
                      hint: Text(
                        "Please choose a Community",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedCommunity = newValue!;
                        });
                      },
                      items: communities
                          .map<DropdownMenuItem<String>>((Community value) {
                        return DropdownMenuItem<String>(
                          value: value.communityName ?? "",
                          child: Text("${value.communityName!}"),
                        );
                      }).toList(),
                    ),
                    TextFormField(
                      controller: pincodeController,
                      keyboardType: TextInputType.number,
                      maxLength: 6,
                      decoration: InputDecoration(
                          hintText: "Enter pincode",
                          labelText:
                              "Pincode"), //errorText: 'value can\'t be empty'
                    ),
                    TextFormField(
                      controller: fullAddressController,
                      keyboardType: TextInputType.name,
                      maxLength: 100,
                      decoration: InputDecoration(
                          hintText: "Enter Full Address", labelText: "Address"),
                    ),
                  ],
                ),
              );
            },
          ),
          actions: [
            Center(
              child: ElevatedButton(
                child: Text("Save",
                    style: TextStyle(
                      color: Colors.white,
                    )),
                onPressed: () async {
                  ConsumerModel con = new ConsumerModel();
                  con.firstName = firstNameController.text;
                  con.lastName = lastNameController.text;
                  con.phoneNo = "91" + mobileController.text;
                  con.organizationName = companyController.text;
                  con.pincode = int.parse(pincodeController.text);
                  con.community = _selectedCommunity;
                  con.houseNo = fullAddressController.text;
                  con.addressType = "Home";
                  con.isValid = false;
                  bool result = await SnapPeNetworks().createNewCustomer(con);
                  if (result) {
                    List<OrderSummaryModel> orders = await SnapPeNetworks()
                        .customerSuggestionsCallback("${con.phoneNo}");
                    Navigator.pop(context);
                    if (orders.length == 0) {
                      SnapPeUI().toastError();
                      return;
                    }
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CartScreen(order: orders[0]),
                        ));
                  }
                },
              ),
            )
          ],
        );
      },
    );
  }

  buildOrderView() {
    if (orders == null) {
      return Center(child: CupertinoActivityIndicator(radius: 20));
    } else if (orders!.length == 0) {
      return Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/noOrders.png"),
          Text("No Orders")
        ],
      ));
    } else {
      return ListView.builder(
          itemCount: orders!.length,
          itemBuilder: (context, index) {
            return OrderWidget(order: orders![index]);
          });
    }
  }

  void loadData() async {
    int toTimestamp = (DateTime.now().millisecondsSinceEpoch / 1000).round();
    int fromTimestamp = toTimestamp - 2629743;

    var response =
        await SnapPeNetworks().getOrderList(fromTimestamp, toTimestamp, 0, 20);

    var com = await SnapPeNetworks().getCommunity();
    //print(communities.length);
    setState(() {
      communities = com;
      orders = orderModelFromJson(response).orders;
    });
  }
}
