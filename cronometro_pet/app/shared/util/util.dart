import 'package:flutter/material.dart';

class Util {
  static void showLoadingPage(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.black.withOpacity(0.5),
                  Colors.black.withOpacity(0.5),
                ],
              ),
            ),
            child: const Center(
              child: CircularProgressIndicator(color: Colors.black),
            ),
          );
        });
  }

  static bool emailValid(String email) {
    final RegExp regex = RegExp(
        r"^(([^<>()[\]\\.,;:\s@\']+(\.[^<>()[\]\\.,;:\s@\']+)*)|(\'.+\'))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$");
    return regex.hasMatch(email);
  }

  String getFormatedDate(String date) {
    date.replaceAll('/', '');
    String value = '${date.substring(4, 8)}' +
        '-' '${date.substring(0, 2)}' +
        '-' '${date.substring(2, 4)}';

    return value;
  }

  static String maskBirthBr(String value) {
    String dateBr = "";
    dateBr = value.substring(8, 10) +
        "/" +
        value.substring(5, 7) +
        "/" +
        value.substring(0, 4);
    return dateBr;
  }

  static String maskBirth(String value) {
    String date = "";
    date = value.substring(6, 10) +
        "-" +
        value.substring(3, 5) +
        "-" +
        value.substring(0, 2);

    return date;
  }
}
