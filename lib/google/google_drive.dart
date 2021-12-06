import 'dart:io';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:googleapis/drive/v3.dart' as ga;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as p;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:extension_google_sign_in_as_googleapis_auth/extension_google_sign_in_as_googleapis_auth.dart';
import 'package:rivercloud/cloud_storage_interface/cloud_storage.dart';
import 'package:rivercloud/ui/drive_home_page.dart';

// Google Drive API credentials data
const _clientId = "585511246848-avu326ukptf6f9g8closm0lbfqkqfofc.apps.googleusercontent.com";
const _scopes = [ga.DriveApi.driveFileScope, ga.DriveApi.driveScope];

class GoogleDrive implements CloudStorageFunctions {

  static Future<FirebaseApp> initializeFirebase({required BuildContext context}) async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();


    User? user = FirebaseAuth.instance.currentUser;

    // Check if user is already logged in
    if (user != null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => DriveHomePage(
            user: user,
          ),
        ),
      );
    }

    return firebaseApp;
  }

  static SnackBar customSnackBar({required String content}) {
    return SnackBar(
      backgroundColor: Colors.black,
      content: Text(
        content,
        style: TextStyle(color: Colors.redAccent, letterSpacing: 0.5),
      ),
    );
  }

  static Future<User?> signInWithGoogle({required BuildContext context}) async {
    // Future<http.Client?> getHttpClient() async {
    // final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: _scopes, clientId: _clientId);
    // var httpClient = (await _googleSignIn.authenticatedClient())!;
    // return httpClient;


    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    final GoogleSignIn googleSignIn = GoogleSignIn(
        scopes: _scopes, clientId: _clientId);

    final GoogleSignInAccount? googleSignInAccount =
    await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential = await auth.signInWithCredential(
            credential);

        user = userCredential.user;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          ScaffoldMessenger.of(context).showSnackBar(
            GoogleDrive.customSnackBar(
              content:
              'The account already exists with a different credential.',
            ),
          );
        } else if (e.code == 'invalid-credential') {
          ScaffoldMessenger.of(context).showSnackBar(
            GoogleDrive.customSnackBar(
              content:
              'Error occurred while accessing credentials. Try again.',
            ),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          GoogleDrive.customSnackBar(
            content: 'Error occurred using Google Sign-In. Try again.',
          ),
        );
      }
    }
    return user;
  }

  static Future<void> signOut({required BuildContext context}) async {
    final GoogleSignIn googleSignIn = GoogleSignIn(scopes: _scopes, clientId: _clientId);
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          GoogleDrive.customSnackBar(
            content: 'Error signing out. Try again.',
          ),
      );
    }
  }

  //UploadFile
  @override
  Future uploadFile(File file) async {
    // var client = await getHttpClient();
    // var drive = ga.DriveApi(client);
    //
    // var response = await drive.files.create(ga.File()..name = p.basename(file.absolute.path),
    //   uploadMedia: ga.Media(file.openRead(), file.lengthSync()));
    //   print(response.toJson());
  }

  //List Files
  @override
  Future listFiles() async {
    // print("List");
    // var client = await getHttpClient();
    // var drive = ga.DriveApi(client);
    // var response = await drive.files.list();
    // print(response.toJson());
  }

  //DownloadFile
  @override
  Future downloadFile(File file) async {
    // var client = await getHttpClient();
    // var drive = ga.DriveApi(client);
    //
    // var response = await drive.files.list();
    // return response.toJson();
  }

  //Remove File
  @override
  Future removeFile(File file) async {
    // var client = await getHttpClient();
    // var drive = ga.DriveApi(client);
    //
    // var response = await drive.files.create(ga.File()..name = p.basename(file.absolute.path),
    //     uploadMedia: ga.Media(file.openRead(), file.lengthSync()));
    // print(response.toJson());
  }

}