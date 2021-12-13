import 'package:flutter/material.dart';
import 'package:rivercloud/google/google_drive.dart';
import 'package:rivercloud/ui/style/style.dart';
import 'package:rivercloud/ui/widgets/google_sign_in_button.dart';
//import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.firebaseNavy,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: 20.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Image.asset(
                        "assets/images/firebase_logo.png",
                        height: 160,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Rivercloud',
                      style: TextStyle(
                        color: CustomColors.firebaseYellow,
                        fontSize: 40,
                      ),
                    ),
                    Text(
                      'Authentication',
                      style: TextStyle(
                        color: CustomColors.firebaseOrange,
                        fontSize: 40,
                      ),
                    ),
                  ],
                ),
              ),
              FutureBuilder(
                future: GoogleDrive.initializeFirebase(context: context),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error initializing Firebase');
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    return GoogleSignInButton();
                  }
                  return CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      CustomColors.firebaseOrange,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// class LoginPage extends StatefulWidget {
//   const LoginPage({Key? key, this.title}) : super(key: key);
//
//   final String? title;
//
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//
//   Widget _entryField(String title, {bool isPassword = false}) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 10),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Text(
//             title,
//             style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           TextField(
//               obscureText: isPassword,
//               decoration: const InputDecoration(
//                   border: InputBorder.none,
//                   fillColor: Color(0xfff3f3f4),
//                   filled: true))
//         ],
//       ),
//     );
//   }
//
//   Widget _submitButton() {
//     return Container(
//       width: MediaQuery.of(context).size.width,
//       padding: const EdgeInsets.symmetric(vertical: 15),
//       alignment: Alignment.center,
//       decoration: BoxDecoration(
//           borderRadius: const BorderRadius.all(Radius.circular(5)),
//           boxShadow: <BoxShadow>[
//             BoxShadow(
//                 color: Colors.grey.shade200,
//                 offset: const Offset(2, 4),
//                 blurRadius: 5,
//                 spreadRadius: 2)
//           ],
//           gradient: const LinearGradient(
//               begin: Alignment.centerLeft,
//               end: Alignment.centerRight,
//               colors: [Color(0xff59daff), Color(0xff6fb2f5)])),
//       child: const Text(
//         'Login',
//         style: TextStyle(fontSize: 20, color: Colors.white),
//       ),
//     );
//   }
//
//   Widget _divider() {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 10),
//       child: Row(
//         children: const <Widget>[
//           SizedBox(
//             width: 20,
//           ),
//           Expanded(
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 10),
//               child: Divider(
//                 thickness: 1,
//               ),
//             ),
//           ),
//           Text('or'),
//           Expanded(
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 10),
//               child: Divider(
//                 thickness: 1,
//               ),
//             ),
//           ),
//           SizedBox(
//             width: 20,
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _googleButton() {
//     return Container(
//       height: 50,
//       margin: const EdgeInsets.symmetric(vertical: 20),
//       decoration: const BoxDecoration(
//         borderRadius: BorderRadius.all(Radius.circular(10)),
//       ),
//       child: Row(
//         children: <Widget>[
//           Expanded(
//             flex: 1,
//             child: Container(
//               decoration: const BoxDecoration(
//                 color: Color(0xffffffff),
//                 borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(5),
//                     topLeft: Radius.circular(5)),
//               ),
//               alignment: Alignment.center,
//               child: IconButton(icon: Image.asset('assets/images/google_logo.png'),
//                 onPressed: () { },
//             ),
//           ),
//           ),
//           Expanded(
//             flex: 5,
//             child: Container(
//               decoration: const BoxDecoration(
//                 color: Color(0xff23ea51),
//                 borderRadius: BorderRadius.only(
//                     bottomRight: Radius.circular(5),
//                     topRight: Radius.circular(5)),
//               ),
//               alignment: Alignment.center,
//               child: const Text('Log in with Google',
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 18,
//                       fontWeight: FontWeight.w400)),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _createAccountLabel() {
//     return InkWell(
//       onTap: () {
//         Navigator.push(
//             context, MaterialPageRoute(builder: (context) => SignUpPage()));
//       },
//       child: Container(
//         margin: const EdgeInsets.symmetric(vertical: 20),
//         padding: const EdgeInsets.all(15),
//         alignment: Alignment.bottomCenter,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: const <Widget>[
//             Text(
//               'Don\'t have an account ?',
//               style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
//             ),
//             SizedBox(
//               width: 10,
//             ),
//             Text(
//               'Register',
//               style: TextStyle(
//                   color: Color(0xfff79c4f),
//                   fontSize: 13,
//                   fontWeight: FontWeight.w600),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _title() {
//     return RichText(
//       textAlign: TextAlign.center,
//       text: const TextSpan(
//           text: 'Rivercloud',
//           style: TextStyle(
//               fontSize: 30,
//               fontWeight: FontWeight.w700,
//               color: Colors.blue),
//       )
//     );
//   }
//
//   Widget _emailPasswordWidget() {
//     return Column(
//       children: <Widget>[
//         _entryField("Email id"),
//         _entryField("Password", isPassword: true),
//       ],
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     return Scaffold(
//         body: Container(
//       height: height,
//       child: Stack(
//         children: <Widget>[
//           //Positioned(
//           //top: -height * .15,
//           //right: -MediaQuery.of(context).size.width * .4,
//           //child: BezierContainer()),
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   SizedBox(height: height * .2),
//                   _title(),
//                   const SizedBox(height: 50),
//                   _emailPasswordWidget(),
//                   const SizedBox(height: 20),
//                   _submitButton(),
//                   Container(
//                     padding: const EdgeInsets.symmetric(vertical: 10),
//                     alignment: Alignment.centerRight,
//                     child: const Text('Forgot Password ?',
//                         style: TextStyle(
//                             fontSize: 14, fontWeight: FontWeight.w500)),
//                   ),
//                   _divider(),
//                   _googleButton(),
//                   SizedBox(height: height * .055),
//                   _createAccountLabel(),
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     ));
//   }
// }
