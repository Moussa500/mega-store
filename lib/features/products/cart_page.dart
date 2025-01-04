import 'package:flutter/material.dart';
import 'package:mega_store/DB/database.dart';
import 'package:mega_store/config/theme/app_colors.dart';
import 'package:mega_store/config/theme/app_sizes.dart';
import 'package:mega_store/models/items_model.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Cart",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: LayoutBuilder(builder: (context, constraints) {
          if (!Database.cart.containsKey(Database.authenticatedUser) ||
              Database.cart[Database.authenticatedUser]!.isEmpty) {
            return Center(
              child: Text("Your cart is empty"),
            );
          } else {
            double total = 0;
            for (var i = 0;
                i < Database.cart[Database.authenticatedUser]!.length;
                i++) {
              total = total + Database.cart[Database.authenticatedUser]![i].price;
            }
            return SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: AppSizes.getDeviceWidth(context),
                    height: AppSizes.getDeviceHight(context) * .7,
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount:
                            Database.cart[Database.authenticatedUser]!.length,
                        itemBuilder: (context, index) {
                          List<ItemsModel> cart =
                              Database.cart[Database.authenticatedUser]!;
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Expanded(
                                child: ListTile(
                                  contentPadding: EdgeInsets.all(10),
                                  tileColor: AppColors.lightGrey,
                                  leading: Image.asset(cart[index].image),
                                  title: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(cart[index].productName),
                                      Text(
                                        "${cart[index].price} DT",
                                        style: TextStyle(color: Colors.green),
                                      ),
                                    ],
                                  ),
                                  trailing: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        Database.cart[Database.authenticatedUser]!
                                            .removeAt(index);
                                      });
                                    },
                                    child: Icon(
                                      Icons.highlight_remove_sharp,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                  Text(
                    "Total ${total} DT",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Text("Are you sure?"),
                              actions: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                    setState(() {
                                      Database.cart[Database.authenticatedUser]!
                                          .clear();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text(
                                          "Items purchased successfully",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        backgroundColor: Colors.green,
                                      ));
                                    });
                                  },
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: AppColors.blue,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    width: 100,
                                    child: Center(
                                      child: Text(
                                        "Yes",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: AppColors.blue,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    width: 100,
                                    child: Center(
                                      child: Text(
                                        "No",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          });
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: AppColors.blue,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      width: AppSizes.getDeviceWidth(context) * .8,
                      child: Center(
                        child: Text(
                          "Pay",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        }),
      ),
    );
  }
}
