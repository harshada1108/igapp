import 'package:shared_preferences/shared_preferences.dart';

  void saveCseToSharedPreferences(int points) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('csePoints', points);
  }

// Function to retrieve CSE points from Shared Preferences
  Future<int?> getCseFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('csePoints');
  }
//2
  void saveMechToSharedPreferences(int points) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('mechp', points);
  }

  Future<int?> getMechFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('mechp');
  }//3
  void saveCivToSharedPreferences(int points) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('civp', points);
  }

// Function to retrieve CSE points from Shared Preferences
  Future<int?> getCivFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('civp');
  }//4
  void saveEceToSharedPreferences(int points) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('ecep', points);
  }

// Function to retrieve CSE points from Shared Preferences
  Future<int?> getEceFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('ecep');
  }//5
  void saveEeeToSharedPreferences(int points) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('eeep', points);
  }

// Function to retrieve CSE points from Shared Preferences
  Future<int?> getEeeFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('eeep');
  }
  void saveMetaToSharedPreferences(int points) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('metap', points);
  }

// Function to retrieve CSE points from Shared Preferences
  Future<int?> getMetaFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('metap');
  }
  void saveChemminToSharedPreferences(int points) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('chemminp', points);
  }

// Function to retrieve CSE points from Shared Preferences
  Future<int?> getChemminFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('chemmin');
  }//
  void saveArchiToSharedPreferences(int points) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('archip', points);
  }

// Function to retrieve CSE points from Shared Preferences
  Future<int?> getArchiFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('archip');
  }




