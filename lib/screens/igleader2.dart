

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:igapp/models/ig_leader_model.dart';
import 'package:provider/provider.dart';

import '../models/ig_enthu_model.dart';
import '../view_model/ig_view_model.dart';
import 'package:igapp/Theme/ThemeModal.dart';
class IgLeaderScreen extends StatefulWidget {
  const IgLeaderScreen({super.key});

  @override
  State<IgLeaderScreen> createState() => _IgLeaderScreenState();
}

class _IgLeaderScreenState extends State<IgLeaderScreen> {

  IgViewModel igViewModel = IgViewModel();
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
          backgroundColor: Colors.white,
          title: Text('IG LEADERBOARD', style: GoogleFonts.poppins(
              fontSize: 20, fontWeight: FontWeight.w700, color: Colors.lightGreen),),
        ),
        body: Column(
          children: [
            Expanded(
              child: FutureBuilder<igleadermodel>(
                future: igViewModel.fetchIgleaderApi(),
                builder: (BuildContext context,
                    AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: Center(
                        child: SpinKitCircle(
                          size: 50,
                          color: Colors.green,
                        ),
                      ),
                    );
                  }
                  else if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        'Error ${snapshot.error}',
                        style: GoogleFonts.poppins(
                            fontSize: 25, fontWeight: FontWeight.w700),
                      ),
                    );
                  }
                  else
                  if (snapshot.data == null || snapshot.data.points == null) {
                    return Center(
                      child: Text(
                        'No Data Available :-( Try after 24 Hours',
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                            fontSize: 25, fontWeight: FontWeight.w700),
                      ),
                    );
                  }
                  else {
                    print("Isme Hoon");

                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: DataTable(
                        columns: [
                          DataColumn(label:Text('INDEX', style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Colors.lightGreen),),),
                          DataColumn(label:Text('LEADERBOARD', style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Colors.lightGreen),),),
                          DataColumn(label:Text('POINTS', style: GoogleFonts.poppins(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: Colors.lightGreen),), ),
                        ],
                        rows: [
                          DataRow(cells: [
                            DataCell(Text('1', style: GoogleFonts.poppins(
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                                color: Colors.lightGreen),),),
                            DataCell(Text('CSE', style: GoogleFonts.poppins(
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                                color: Colors.lightGreen),),),
                            DataCell( Text(snapshot.data.points.cSE.toString(),
                              style: GoogleFonts.poppins(fontSize: 17,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.lightGreen),),),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('2', style: GoogleFonts.poppins(
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                                color: Colors.lightGreen),),),
                            DataCell(Text('ECE', style: GoogleFonts.poppins(
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                                color: Colors.lightGreen),),),
                            DataCell( Text(snapshot.data.points.eCE.toString(),
                                style: GoogleFonts.poppins(fontSize: 17,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.lightGreen)),),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('3', style: GoogleFonts.poppins(
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                                color: Colors.lightGreen),),),
                            DataCell( Text('EEE', style: GoogleFonts.poppins(
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                                color: Colors.lightGreen),),),
                            DataCell(  Text(snapshot.data.points.eEE.toString(),
                              style: GoogleFonts.poppins(fontSize: 17,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.lightGreen),),),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('4', style: GoogleFonts.poppins(
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                                color: Colors.lightGreen),),),
                            DataCell( Text('MECH', style: GoogleFonts.poppins(
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                                color: Colors.lightGreen),),),
                            DataCell(Text(snapshot.data.points.mECH.toString(),
                              style: GoogleFonts.poppins(fontSize: 17,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.lightGreen),),),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('5', style: GoogleFonts.poppins(
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                                color: Colors.lightGreen),),),
                            DataCell(Text('CIVIL', style: GoogleFonts.poppins(
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                                color: Colors.lightGreen),),),
                            DataCell( Text(snapshot.data.points.cIVIL.toString(),
                              style: GoogleFonts.poppins(fontSize: 17,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.lightGreen),),),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('6', style: GoogleFonts.poppins(
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                                color: Colors.lightGreen),),),

                            DataCell(Text('CHEMMIN', style: GoogleFonts.poppins(
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                                color: Colors.lightGreen),),),
                            DataCell( Text(snapshot.data.points.cHEMMIN.toString(),
                              style: GoogleFonts.poppins(fontSize: 17,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.lightGreen),),),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('7', style: GoogleFonts.poppins(
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                                color: Colors.lightGreen),),),

                            DataCell(Text('META', style: GoogleFonts.poppins(
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                                color: Colors.lightGreen),),),
                            DataCell( Text(snapshot.data.points.mETA.toString(),
                              style: GoogleFonts.poppins(fontSize: 17,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.lightGreen),),),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('8', style: GoogleFonts.poppins(
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                                color: Colors.lightGreen),),),

                            DataCell(Text('ARCHI', style: GoogleFonts.poppins(
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                                color: Colors.lightGreen),),),
                            DataCell( Text(snapshot.data.points.aRCHI.toString(),
                              style: GoogleFonts.poppins(fontSize: 17,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.lightGreen),),),
                          ]),







                        ],
                      ),
                    );



                  }
                },

              ),
            ),
          ],
        ),
      );
    });
  }
}
