import 'package:flutter/material.dart';
import 'package:rivercloud/ui/style/style.dart';


class AppBarTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/google_logo.png',
          height: 20,
        ),
        SizedBox(width: 8),
        Text(
          'Rivercloud',
          style: TextStyle(
            color: CustomColors.firebaseYellow,
            fontSize: 18,
          ),
        ),
        Text(
          ' Authentication',
          style: TextStyle(
            color: CustomColors.firebaseOrange,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}