
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:igapp/models/ig_leader_model.dart';

import '../view_model/ig_view_model.dart';

class IgleaderScreen extends StatefulWidget {
  const IgleaderScreen({super.key});

  @override
  State<IgleaderScreen> createState() => _IgleaderScreenState();
}

class _IgleaderScreenState extends State<IgleaderScreen> {

  IgViewModel igViewModel = IgViewModel();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width*1;
    final height = MediaQuery.sizeOf(context).height*1;

    return Scaffold(
      appBar: AppBar(
        title: Text('Ig LeaderBoard',style: GoogleFonts.poppins(fontSize: 25,fontWeight: FontWeight.w700,color: Colors.black),),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder<igleadermodel>(
                future:igViewModel.fetchIgleaderApi(),
                builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot){
                  if(snapshot.connectionState==ConnectionState.waiting)
                  {
                    return Center(
                      child: SpinKitCircle(
                        size: 50,
                        color: Colors.blue,
                      ),
                    );
                  }
                  else if(snapshot.hasError)
                  {
                    return Center(
                      child: Text(
                        'Error ${snapshot.error}',
                        style: GoogleFonts.poppins(fontSize: 25,fontWeight: FontWeight.w700),
                      ),
                    );
                  }
                  else if(snapshot.data==null || snapshot.data.points==null)
                  {
                    return Center(
                      child: Text(
                        'No Data Available :-( Try after 24 Hours',
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(fontSize: 25,fontWeight: FontWeight.w700),
                      ),
                    );
                  }
                  else {
                    print("Isme Hoon");

                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.teal
                          ),
                          height: height*0.10,

                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('CSE',style: GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.w700,color: Colors.white),),
                                Text(snapshot.data.points.cSE.toString(),style: GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.w700,color: Colors.white),),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.teal
                          ),
                          height: height*0.10,

                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('ECE',style: GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.w700,color: Colors.white),),
                                Text(snapshot.data.points.eCE.toString(),style: GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.w700,color: Colors.white),),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.teal
                          ),
                          height: height*0.10,

                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('EEE',style: GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.w700,color: Colors.white),),
                                Text(snapshot.data.points.eEE.toString(),style: GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.w700,color: Colors.white),),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.teal
                          ),
                          height: height*0.10,

                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('MECH',style: GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.w700,color: Colors.white),),
                                Text(snapshot.data.points.mECH.toString(),style: GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.w700,color: Colors.white),),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.teal
                          ),
                          height: height*0.10,

                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('CIVIL',style: GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.w700,color: Colors.white),),
                                Text(snapshot.data.points.cIVIL.toString(),style: GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.w700,color: Colors.white),),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.teal
                          ),
                          height: height*0.10,

                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('CHEMMIN',style: GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.w700,color: Colors.white),),
                                Text(snapshot.data.points.cHEMMIN.toString(),style: GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.w700,color: Colors.white),),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.teal
                          ),
                          height: height*0.10,

                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('META',style: GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.w700,color: Colors.white),),
                                Text(snapshot.data.points.mETA.toString(),style: GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.w700,color: Colors.white),),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.teal
                          ),
                          height: height*0.10,

                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('ARCHI',style: GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.w700,color: Colors.white),),
                                Text(snapshot.data.points.aRCHI.toString(),style: GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.w700,color: Colors.white),),
                              ],
                            ),
                          ),
                        ),


                      ],
                    );
                  }


                },

              ),
            ),
          ],
        ),
      ),
    );;
  }
}
