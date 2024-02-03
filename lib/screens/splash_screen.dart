import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_setting.dart';
import 'package:flutter_application_1/screens/home_page.dart';
import 'package:flutter_application_1/screens/sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    handleLogin();
  }

  Future<void> handleLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? userPhoneNumber =
        prefs.getString(AppSettings.phoneNumberSharedPrefsKey);
    if (userPhoneNumber == null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SignInPage()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    }
  }

// save data in shared
// create splash screen
// get data shared prefs

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}