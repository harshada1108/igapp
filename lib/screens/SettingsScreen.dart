import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:igapp/Theme/ThemeModal.dart';
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context,ThemeModal themeNotifier , child){
      return Scaffold(
        appBar: AppBar(
          title: Text('Theme'),
          backgroundColor: Colors.transparent,
        ),

        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SwitchListTile(value:themeNotifier.isDark ? false :true ,
                  title: Text(themeNotifier.isDark ? "Dark Theme" : "Light Theme"),
                  onChanged:(value){
                    themeNotifier.isDark ? themeNotifier.isDark = false :themeNotifier.isDark = true;
                  }

              ),


            ],

          ),
        ),
      );
    });
  }
}

