import 'package:flutter/material.dart';
import 'package:mega_store/config/theme/app_theme.dart';
import 'package:mega_store/features/auth/register_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
      home: RegisterPage(),
    );
  }
}