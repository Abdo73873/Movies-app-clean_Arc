import 'package:flutter/cupertino.dart';

class ErrorModel {
  late final int statusCode;
  late final String statusMessage;
  late final bool success;

  ErrorModel({required this.statusCode,
    required this.statusMessage,
    required this.success});

  factory ErrorModel.fromJson(Map<String, dynamic> json)=>
      ErrorModel(
          statusCode: json['status_code'],
          statusMessage: json['status_message'],
          success:json['success'],
      );




}
