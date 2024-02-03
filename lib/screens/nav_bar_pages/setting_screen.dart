import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_setting.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  String userPhone = "";
  @override
  void initState() {
    super.initState();
    getUserPhoneNumber();
  }

  Future<void> getUserPhoneNumber() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    userPhone = prefs.getString(AppSettings.phoneNumberSharedPrefsKey) ?? "--";
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CircleAvatar(
          radius: 50,
          child: Icon(
            Icons.person,
            color: Colors.blue,
            size: 60,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Center(child: Text("User phone:$userPhone")),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: Colors.grey[200],
            child: ListTile(
              leading: Icon(Icons.edit),
              title: Text("Edit Prefile"),
              subtitle: Text("Manage your account"),
              trailing: Icon(Icons.arrow_back_ios),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: Colors.grey[200],
            child: ListTile(
              leading: Icon(Icons.settings),
              title: Text("App Settings"),
              subtitle: Text("Manage your Settings"),
              trailing: Icon(Icons.arrow_back_ios),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: Colors.grey[200],
            child: ListTile(
              leading: Icon(Icons.info),
              title: Text("About app"),
              subtitle: Text("data about developer and appliction"),
              trailing: Icon(Icons.arrow_back_ios),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: Colors.grey[200],
            child: ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Signout"),
              trailing: Icon(Icons.arrow_back_ios),
            ),
          ),
        ),
      ],
    );
  }
}
