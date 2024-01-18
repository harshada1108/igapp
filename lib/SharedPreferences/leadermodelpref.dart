import 'package:shared_preferences/shared_preferences.dart';
 class LeadermodelPref
{

  static SharedPreferences? _preferences ;
  static const _Cse = 'cse' ;
  static const _Mech = 'mech' ;
  static const _Ece = 'ece' ;
  static const _Eee = 'eee' ;
  static const _Archi = 'archi' ;
  static const _Civ = 'civ' ;
  static const _Meta = 'meta' ;
  static const _Chemmin = 'chemmin' ;


  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();
   static Future<bool>setCse( String branch) async {
     SharedPreferences xyz = await SharedPreferences.getInstance();
     return await xyz.setString(_Cse, branch);
  }

  static Future<String?> getCse()async
  {    SharedPreferences xyz = await SharedPreferences.getInstance();
     return  xyz.getString(_Cse);
  }

  static Future setMech(String branch) async =>
      await _preferences?.setString(_Mech, branch);

  static String? getMech() => _preferences?.getString(_Mech);

  static Future setEce(String branch) async =>
      await _preferences?.setString(_Ece, branch);

  static String? getEce() => _preferences?.getString(_Ece);

  static Future setEee(String branch) async =>
      await _preferences?.setString(_Eee, branch);

  static String? getEee() => _preferences?.getString(_Eee);

  static Future setArchi(String branch) async =>
      await _preferences?.setString(_Archi, branch);

  static String? getArchi() => _preferences?.getString(_Archi);

  static Future setCiv(String branch) async =>
      await _preferences?.setString(_Civ, branch);

  static String? getCiv() => _preferences?.getString(_Civ);

  static Future setMeta(String branch) async =>
      await _preferences?.setString(_Meta, branch);

  static String? getMeta() => _preferences?.getString(_Meta);

  static Future setChemmin(String branch) async =>
      await _preferences?.setString(_Chemmin, branch);

  static String? getChemmin() => _preferences?.getString(_Chemmin);






}
class Helper {
   static SharedPreferences? _preferences ;
  static String valueSharedPreferences = 'cse' ;

// Write DATA
  static Future<bool?> saveUserData(value) async {
    _preferences = await SharedPreferences.getInstance();
    return await _preferences?.setInt(valueSharedPreferences, value);
  }

// Read Data
   static Future getUserData() async {
    _preferences = await SharedPreferences.getInstance();
    return _preferences?.getInt(valueSharedPreferences);
  }
}