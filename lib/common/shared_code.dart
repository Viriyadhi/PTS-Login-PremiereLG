import 'package:flutter/material.dart';

class SharedCode {
  String? emptyValidator(value) {
    return value.toString().trim().isEmpty ? 'Field can\'t be empty' : null;
  }

  String? passwordValidator(value) {
    return value.toString().length < 6 ? 'Password can\'t be less than 6 characters' : null;
  }

  String? emailValidator(value) {
    bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value);
    return !emailValid ? 'Email is not valid' : null;
  }

  String? passwordConfirmValidator(String value1 , String value2) {
    if (value1.isEmpty || value2.isEmpty) {
      return 'Password doesn\'t match';
    } else {
      return value2 != value1 ? 'Password doesn\'t match' : null;
    }
  }

  static void showSnackBar(
      BuildContext context, String status, String content, {Duration? duration}) {
    Color color = Colors.green;
    switch (status) {
      case 'success':
        color = Colors.green;
        break;
      case 'error':
        color = Colors.red;
        break;
    }

    SnackBar snackBar = SnackBar(
      content: Text(content, style: const TextStyle(color: Colors.white)),
      backgroundColor: color,
      duration: duration ?? const Duration(milliseconds: 4000),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}