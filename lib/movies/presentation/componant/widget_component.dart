import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget circularProgress({double? height})=> SizedBox(
    height: height,
    child: const Center(child: CircularProgressIndicator(
      color: Colors.white,
    )));
Widget errorMessageWidget(String message)=>SizedBox(
    height: 400,
    child: Center(child: Text(message)));