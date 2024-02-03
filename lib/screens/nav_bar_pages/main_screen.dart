import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/product_details_screen.dart';
import 'package:flutter_application_1/widgets/item_card_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<String> productName = ["Product 1", "mobile", "laptop"];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: productName.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProductDetailsScreenState(
                          productName: productName[index],
                        )),
              );
            },
            child: ItemCard(productName: productName[index]));
      },
    );
  }
}
