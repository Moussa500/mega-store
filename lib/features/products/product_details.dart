import 'package:flutter/material.dart';
import 'package:mega_store/DB/database.dart';
import 'package:mega_store/config/theme/app_colors.dart';
import 'package:mega_store/config/theme/app_sizes.dart';
import 'package:mega_store/features/products/cart_page.dart';

class ProductDetails extends StatelessWidget {
  final int index;
  const ProductDetails({super.key, required this.index});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          actions: [
            GestureDetector(
                onTap: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => CartPage())),
                child: Icon(Icons.shopping_cart_outlined))
          ],
          centerTitle: true,
          title: Text(
            '${Database.items[index].productName}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: AppSizes.getDeviceWidth(context) * .9,
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Color(0xffFAFAFA),
                    ),
                    child: Image.asset(Database.items[index].image),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  Database.items[index].productName,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "${Database.items[index].price} DT",
                  style: TextStyle(
                      color: AppColors.red,
                      fontSize: 30,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 20,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "${Database.items[index].rating}\t ${Database.items[index].reviewers} Reviews",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    Database.items[index].description,
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                    onTap: () {
                      if (Database.cart.containsKey(Database.authenticatedUser)) {
                        Database.cart[Database.authenticatedUser]!
                            .add(Database.items[index]);
                      } else {
                        Database.cart[Database.authenticatedUser] = [
                          Database.items[index]
                        ];
                      }
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                          "Item added Successfully",
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Colors.green,
                      ));
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: AppColors.blue,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      width: AppSizes.getDeviceWidth(context) * .8,
                      child: Center(
                        child: Text(
                          "Add to cart",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
