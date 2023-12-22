import 'package:flutter/material.dart';
import 'package:igapp/screens/SplashScreen.dart';

import 'package:igapp/screens/ig_schedule_screen.dart';
import 'package:igapp/Theme/ThemeModal.dart';
import 'package:provider/provider.dart';
import 'dart:io';


void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (_) => ThemeModal(),
        child: Consumer(builder: (context , ThemeModal themeModal , child){
          return MaterialApp(


            debugShowCheckedModeBanner: false,
            theme: themeModal.isDark? ThemeData.dark() : ThemeData.light(),
            home:  SplashScreen(),
          );
        })
    );
  }
}
