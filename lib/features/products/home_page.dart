import 'package:flutter/material.dart';
import 'package:mega_store/DB/database.dart';
import 'package:mega_store/config/theme/app_colors.dart';
import 'package:mega_store/config/theme/app_sizes.dart';
import 'package:mega_store/features/products/cart_page.dart';
import 'package:mega_store/features/products/product_details.dart';
import 'package:mega_store/helpers/additional_methods.dart';
import 'package:mega_store/models/items_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController searchController = TextEditingController();
  List<ItemsModel> items = Database.items;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: Container(),
            actions: [
              GestureDetector(
                  onTap: () => Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => CartPage())),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.shopping_cart_outlined),
                  ))
            ],
            centerTitle: true,
            elevation: 0,
            title: Text(
              "Home",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Products",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: AppSizes.getDeviceWidth(context) * 0.9,
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          if (searchController.text.isEmpty) {
                            items = Database.items;
                          } else {
                            items =
                                AdditionalMethods.search(searchController.text);
                          }
                        });
                      },
                      controller: searchController,
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.search),
                        hintText: "Search Product Name",
                        fillColor: AppColors.lightGrey,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  items.isEmpty
                      ? Center(
                          child: Text("No items match the specified name"),
                        )
                      : Container(
                          decoration: BoxDecoration(
                              color: Color(0xffFAFAFA),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          width: AppSizes.getDeviceWidth(context),
                          height: 500,
                          child: GridView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: items.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      childAspectRatio: 0.5625,
                                      mainAxisSpacing: 20,
                                      crossAxisCount: 2),
                              itemBuilder: (context, index) {
                                ItemsModel item = items[index];
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: () => Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ProductDetails(index: index))),
                                    child: Container(
                                      color: Colors.white,
                                      width: 165,
                                      height: 242,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Image.asset(
                                            item.image,
                                            width: 125,
                                            height: 125,
                                          ),
                                          Text(
                                            item.productName,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                          Text(
                                            '${item.price} DT',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: AppColors.red),
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.star,
                                                color: Colors.yellow,
                                              ),
                                              Text(
                                                  "${item.rating}\t ${item.reviewers} Reviews"),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
