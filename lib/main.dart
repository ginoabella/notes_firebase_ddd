import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:notes_firebase/injection.dart';
import 'package:notes_firebase/presentation/core/app_widget.dart';

void main() {
  configureInjection(Environment.prod);
  runApp(AppWidget());
}
