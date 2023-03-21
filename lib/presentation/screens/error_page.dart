import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ErrorPage extends StatelessWidget {
  final String erorText;
  const ErrorPage({super.key, required this.erorText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        erorText,
        style: TextStyle(fontSize: 25),
      )),
    );
  }
}
