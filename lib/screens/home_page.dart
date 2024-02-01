import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/nav_bar_pages/categorise_screen.dart';
import 'package:flutter_application_1/screens/nav_bar_pages/main_screen.dart';
import 'package:flutter_application_1/screens/nav_bar_pages/setting_screen.dart';
import 'package:flutter_application_1/screens/sign_in.dart';

class HomePage extends StatefulWidget {
  final String phoneNumber;
  const HomePage({super.key, required this.phoneNumber});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;
  List<Widget> pages = [
    MainScreen(),
    CategoriesScreen(),
    SettingScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width / 2,
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => SignInPage()),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Icon(Icons.exit_to_app), Text("Signout")],
                ),
              )
            ],
          )),
      appBar: AppBar(),
      body: pages[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: pageIndex,
          onTap: onNavBarTapped,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.category), label: "categories"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "Settings"),
          ]),
    );
  }

  onNavBarTapped(int index) {
    pageIndex = index;
    setState(() {});
  }
}
