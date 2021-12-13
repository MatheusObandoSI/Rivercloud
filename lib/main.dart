import 'package:flutter/material.dart';
import 'package:rivercloud/google/google_auth.dart';
import 'package:rivercloud/ui/login.dart';
import 'package:rivercloud/ui/drive_home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  // TODO: Must check if the user is already logged in and show up the current service main page
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rivercloud Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}
