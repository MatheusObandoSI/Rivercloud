import 'package:flutter/material.dart';
import 'package:rivercloud/google/google_drive.dart';
//import 'package:file_picker/file_picker.dart';
//import 'package:rivercloud/google/google_drive.dart';
import 'package:rivercloud/ui/login.dart';
import 'package:rivercloud/ui/drive_home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // Hardcoded for test purposes
  //final GoogleDrive gDrive = GoogleDrive();

  // Another service instance:
  // final another = new AnotherService();

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
