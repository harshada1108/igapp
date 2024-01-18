import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:igapp/Theme/ThemeModal.dart';
import 'package:igapp/models/schedule.dart';
import 'package:igapp/screens/SettingsScreen.dart';

import 'package:igapp/screens/ig_schedule_screen.dart';
import 'package:igapp/screens/ig_schedule_screen2.dart';
import 'package:igapp/screens/igleader2.dart';
import 'package:igapp/screens/igenthu.dart';
import 'package:provider/provider.dart';

class HomeScreen2 extends StatefulWidget {
  const HomeScreen2({super.key});

  @override
  State<HomeScreen2> createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {
  @override
  Widget build(BuildContext context) {
      return Consumer(builder: (context, ThemeModal themeNotifier, child)
    {
      return Scaffold(
        appBar: AppBar(

          backgroundColor: Colors.green[900],
          leading: Container(), // Set an empty container as the leading widget
          title: Padding(
            padding: const EdgeInsets.only(left: 2),
            child: Text(
              "IG 2024",
              style: GoogleFonts.brawler(fontWeight: FontWeight.w400, fontSize: 20),
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Hero(
                  tag: 'iglogo',
                  child: TweenAnimationBuilder(
                    duration: Duration(seconds: 1),
                    tween: Tween<double>(begin: 1, end: 1), // Adjust as needed
                    builder: (BuildContext context, double value, Widget? child) {
                      return Transform.scale(
                        scale: value,
                        child: child,
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: CircleAvatar(backgroundColor: Colors.lightGreen),
                    ),
                  ),
                ),

                // Add any other action widgets you may need here
              ],
            ),
          ],
        ),

        body :Center(
        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),

          crossAxisSpacing: 5,
          mainAxisSpacing: 6,
          crossAxisCount: 2,
          children: <Widget>[

            Container(

              height: 50,
              padding: const EdgeInsets.all(8),


              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('images/ids333-removebg-preview.png'),
                fit: BoxFit.cover),
                color:  Colors.green[600],



              ),


            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('images/STUDENTCLOGO-removebg-preview (1).png'),
                    fit: BoxFit.cover),
                color: Colors.green[500],



              ),




            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => IgLeaderScreen()));
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                color: Colors.green[400],
                child: Text('Ig Leaderboard Screen'),

              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => IgEnthuScreen()));
              },


              child: Container(
                padding: const EdgeInsets.all(8),

                color: Colors.green[300],
                child: Text("EnthuBoard"),


              ),
            ),
            InkWell(
              onTap:  (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => IgScheduleScreen2()));
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                color: Colors.green[200],
                child: Text('ScheduleScreen'),


              ),
            ),
            InkWell(
              onTap:(){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => SettingsScreen()));
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                color: Colors.green[100],
                child: Text("settings"),



              ),
            ),
          ],
        ),
      )

      );
    });
  }
}

