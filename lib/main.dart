import 'package:bulky_sms_app/style/theme.dart';
import 'package:flutter/material.dart';

import 'screens/login_page.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: LoginPage(),
    );
  }
}

