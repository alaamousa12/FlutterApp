import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home_page.dart';
import 'package:flutter_application_1/widgets/app_bottom.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 150,
              ),
              SizedBox(
                  width: 300,
                  height: 300,
                  child: Image.asset("assets/alahly.png")),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: phoneNumberController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    labelText: "Phone Number",
                  ),
                  validator: (value) {
                    if (value!.length > 8 && value.length < 10) {
                      return null;
                    } else {
                      return "Invalid Phone number";
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    labelText: "Password",
                  ),
                  validator: (value) {
                    if (value!.length < 8) {
                      return "invalid password";
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              AppBottom(
                label: "Log in",
                color: Colors.blue[300]!,
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    if (kDebugMode) {
                      print("Logged in");
                    }
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => WelcomePage(
                    //             phoneNumber: phoneNumberController.text,
                    //           )),
                    // );
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomePage(
                                phoneNumber: phoneNumberController.text,
                              )),
                    );
                    // phoneNumberController.clear();
                    passwordController.clear();
                  }
                },
              ),
              const SizedBox(
                height: 15,
              ),
              const Text("Forgot password? no yawa, Tap me"),
              const SizedBox(
                height: 15,
              ),
              AppBottom(
                label: "No account, sign up",
                color: Colors.grey,
                onTap: () {
                  print("Sign up");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
