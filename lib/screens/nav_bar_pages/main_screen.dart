import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/item_card_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<String> productName = [
    "Product 1",
    "mobile",
    "laptop"
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: productName.length,
      itemBuilder: (context,index){
        return ItemCard(productName: productName[index]);
      },
      separatorBuilder: (context, index) {
        return Divider();
      },
      );
  }
}
