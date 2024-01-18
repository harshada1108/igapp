import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:igapp/Theme/ThemeModal.dart';
import 'package:igapp/deptscreens/ids.dart';
import 'package:igapp/models/schedule.dart';
import 'package:igapp/screens/SettingsScreen.dart';

import 'package:igapp/screens/ig_schedule_screen.dart';
import 'package:igapp/screens/ig_schedule_screen2.dart';
import 'package:igapp/screens/igleader2.dart';
import 'package:igapp/screens/igenthu.dart';
import 'package:provider/provider.dart';


class HomeScreenUi extends StatefulWidget {
  late   String username;
  late  String branch;


  HomeScreenUi({Key? key, required this.username, required this.branch}) : super(key: key);



  @override
  State<HomeScreenUi> createState() => _HomeScreenUiState();
}

class _HomeScreenUiState extends State<HomeScreenUi> {

  List<bool> isBorderVisibleList = List.generate(10, (index) => true);
  List<String> assetImages = [
    'images/ids333-removebg-preview.png',
    'deptlogos/ARC.png',
    'deptlogos/CIV.png',
    'deptlogos/CME.png',
    'deptlogos/CSE.png',
    'deptlogos/ECE.png',
    'deptlogos/EE.png',
    'deptlogos/MECH.png',
    'deptlogos/MIN.png',
    'deptlogos/MME.png',
    // Add more asset image paths as needed
  ];


  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ThemeModal themeNotifier, child)
    {
      return Scaffold(

        appBar: AppBar(
          title: Text('IG 2024'),
          elevation: 0,
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Instagram Story UI
              Container(
                height: 120.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: assetImages.length, // Number of stories
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          isBorderVisibleList[index] = false;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.all(8.0),
                        width: 80.0,
                        height: 150,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,

                          border: Border.all(
                            color: isBorderVisibleList[index]
                                ? Colors.blue
                                : Colors.transparent,
                            width: 3.0,
                          ),
                          image: DecorationImage(

                            image: AssetImage(assetImages[index]),// Replace with your image URL
                            fit: BoxFit.cover,

                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              ListTile(title: Text(" About us"),titleTextStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Card(



                      shape:RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),

                      child: CircleAvatar(backgroundImage: AssetImage("images/STUDENTCLOGO-removebg-preview (1).png"),radius: 70,
                      backgroundColor: Colors.transparent,),
                    ),
                    InkWell(
                      onTap: (){
                      Navigator.push(context, MaterialPageRoute(
                      builder: (context) => IDS()));
                      }
                      ,
                      child: Card(
                        shape:RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)
                        ),

                        child: CircleAvatar(backgroundImage: AssetImage("images/ids333-removebg-preview.png"),radius: 70,
                          backgroundColor: Colors.transparent,),
                      ),
                    ),

                  ],
                ),
              ),
              ListTile(title: Text(" Upcoming events and schedular"),titleTextStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap:(){
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => IgLeaderScreen()));

                }, child: Card(


                          child: CircleAvatar(backgroundImage: AssetImage("deptlogos/leaderboard-removebg-preview.png"),radius: 70,
                            backgroundColor: Colors.transparent,),
                        ),
                      ),
                      InkWell(

                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => IgEnthuScreen()));

                        },
                        child: Card(
                          shape:RoundedRectangleBorder(

                          ),

                          child: CircleAvatar(backgroundImage: AssetImage("deptlogos/enthuboard-removebg-preview.png"),radius: 70,
                            backgroundColor: Colors.transparent,),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => IgScheduleScreen2()));
                        },
                        child: Card(


                          child: CircleAvatar(backgroundImage: AssetImage("deptlogos/schedular-removebg-preview.png"),radius: 70,
                              backgroundColor: Colors.transparent



                        ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),


              // List of Containers


            ],
          ),

        ),
        drawer: Drawer(
          width: MediaQuery.of(context).size.width * 0.7,

          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.green,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 45,

                    ),

                    Text(
                     widget.username ,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      widget.branch,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                title: Text("Notifications"),
                onTap: () {
                  // Handle item 1 tap
                },
              ),
              ListTile(
                title: Text('Settings'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => SettingsScreen()));
                  // Handle item 2 tap
                },
              ),
              // Add more ListTiles as needed
            ],
          ),

        ),


      );
    });
  }
}

