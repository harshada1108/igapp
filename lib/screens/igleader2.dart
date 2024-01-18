
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:igapp/SharedPreferences/leadermodelpref.dart';
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
  late int csep;
  late AsyncSnapshot<int> cseval =AsyncSnapshot<int>.nothing();
  late Future<igleadermodel> leaderModelFuture;
  bool isDataFetched = false;

  late Future<dynamic> mechp;
  late Future<dynamic> civp;
  late Future<dynamic> metap;
  late Future<dynamic> chemminp;
  late Future<dynamic> archip;
  late Future<dynamic> ecep;
  late Future<dynamic> eeep;

  IgViewModel igViewModel = IgViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    leaderModelFuture = igViewModel.fetchIgleaderApi();
    getCseFromSharedPreferences().then((value) {
      setState(() {
        cseval = AsyncSnapshot<int>.withData(
          ConnectionState.done,
          value ?? csep, // Provide a default value if null
        );
        isDataFetched = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ThemeModal themeNotifier, child) {
      final width = MediaQuery.of(context).size.width * 1;
      final height = MediaQuery.of(context).size.height * 1;

      return Scaffold(
        appBar: AppBar(
          backgroundColor:
          themeNotifier.isDark ? Colors.transparent : Colors.white,
          title: Text(
            'IG LEADERBOARD',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.lightGreen,
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: FutureBuilder<igleadermodel>(
                future: leaderModelFuture,
                builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: SpinKitCircle(
                        size: 50,
                        color: Colors.green,
                      ),
                    );
                  } else if (snapshot.hasError) {
                    var cseval1 = cseval;
                    print(cseval1);


                    return Center(
                      child: Text(

                        cseval1.data.toString(),
                        style: GoogleFonts.poppins(
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    );
                  } else if (snapshot.data == null || snapshot.data.points == null) {
                    return Center(
                      child: Text(
                        'No Data Available :-( Try after 24 Hours',
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    );
                  } else {
                    csep = snapshot.data.points.cSE;
                    saveCseToSharedPreferences(csep);
                    if (!isDataFetched &&
                        (cseval.connectionState == ConnectionState.none ||
                            cseval.connectionState == ConnectionState.waiting)) {
                      // Fetch the CSE value only once when the AsyncSnapshot is not done yet
                      getCseFromSharedPreferences().then((value) {
                        setState(() {
                          cseval = AsyncSnapshot<int>.withData(
                            ConnectionState.done,
                            value ?? csep, // Provide a default value if null
                          );
                          isDataFetched = true;
                        });
                      });
                    }
                    print(cseval.data.toString());







                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                      child: DataTable(
                        columns: [
                          DataColumn(
                            label: Text(
                              'INDEX',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: Colors.lightGreen,
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'LEADERBOARD',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: Colors.lightGreen,
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'POINTS',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: Colors.lightGreen,
                              ),
                            ),
                          ),
                        ],
                        rows: [
                          DataRow(cells: [
                            DataCell(
                              Text(
                                '1',
                                style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.lightGreen,
                                ),
                              ),
                            ),
                            DataCell(
                              Text(
                                'CSE',
                                style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.lightGreen,
                                ),
                              ),
                            ),
                            DataCell(
                              Text(
                       cseval.data.toString(),
                                style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.lightGreen,
                                ),
                              ),
                            ),
                          ]),
                          // ... other rows
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

  // Function to save CSE points to Shared Preferences
  void saveCseToSharedPreferences(int points) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('csePoints', points);
  }

  // Function to retrieve CSE points from Shared Preferences
  Future<int?> getCseFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('csePoints');
  }
}