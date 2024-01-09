

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:igapp/view_model/ig_view_model.dart';
import 'package:intl/intl.dart';

import '../models/schedule.dart';
import 'package:igapp/Theme/ThemeModal.dart';
import 'package:provider/provider.dart';


class IgScheduleScreen2 extends StatefulWidget {
  const IgScheduleScreen2({super.key});

  @override
  State<IgScheduleScreen2> createState() => _IgScheduleScreen2State();
}


enum FilterList{ zerothday, firstday }
class _IgScheduleScreen2State extends State<IgScheduleScreen2> {

  IgViewModel igViewModel= new IgViewModel();
  FilterList? selectedMenu;

  final format= DateFormat('dd/MM/yy');
  String name='20231120';
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ThemeModal themeNotifier, child)
    {
      final width = MediaQuery
          .sizeOf(context)
          .width * 1;
      final height = MediaQuery
          .sizeOf(context)
          .height * 1;
      return Scaffold(
        appBar: AppBar(
          titleSpacing: 20,
          backgroundColor: Colors.green,
          title: Text('Schedule', style: GoogleFonts.poppins(
              fontSize: 24, fontWeight: FontWeight.w700),),
          actions: [
            PopupMenuButton<FilterList>(
                initialValue: selectedMenu,
                onSelected: (FilterList item) {
                  if (FilterList.zerothday.name == item.name) {
                    name = '20231120';
                  }
                  if (FilterList.firstday.name == item.name) {
                    name = '20231121';
                  }


                  setState(() {
                    selectedMenu = item;
                  });
                },
                itemBuilder: (BuildContext context) =>
                <PopupMenuEntry<FilterList>>[
                  PopupMenuItem<FilterList>(
                    value: FilterList.zerothday,
                    child: Text('20/11/2023'),),
                  PopupMenuItem<FilterList>(
                    value: FilterList.firstday,
                    child: Text('21/11/2023'),),
                ])
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: height,
                width: width,
                child: FutureBuilder<schedulemodel>(
                  future: igViewModel.fetchIgscheduleApi(name),
                  builder: (BuildContext context,
                      AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: SpinKitCircle(
                          size: 50,
                          color: Colors.green,
                        ),
                      );
                    }
                    else {
                      return ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: snapshot.data!.schedules!.length,
                          itemBuilder: (context, index) {
                            DateTime dateTime = DateTime.parse(
                                snapshot.data!.schedules![index].date
                                    .toString());
                            return Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white70.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      spreadRadius: 5,
                                      offset: Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(

                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(


                                        child: CircleAvatar(

                                          backgroundImage: AssetImage('deptlogos/'+snapshot.data!.schedules![index].team1.toString()+'.png'),
                                          radius: 50,
                                          backgroundColor: Colors.black26,
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            snapshot.data!.schedules![index].gameName.toString(),
                                            style: TextStyle(fontWeight: FontWeight.w400),
                                          ),
                                          Text(snapshot.data!.schedules![index].venue.toString()),
                                          Text(snapshot.data!.schedules![index].date.toString()),
                                          Text(snapshot.data!.schedules![index].time.toString()),
                                        ],
                                      ),
                                      CircleAvatar(

                                        backgroundImage: AssetImage('deptlogos/'+snapshot.data!.schedules![index].team2.toString()+'.png'),
                                        radius: 50,
                                        backgroundColor: Colors.black26,
                                      ),
                                    ],

                                  ),
                                ),
                              ),
                            );

                          }
                      );
                    }
                  },

                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
const spinkitty=SpinKitFadingCircle(
  size: 50,
  color: Colors.amber,
);