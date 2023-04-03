import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class User extends ChangeNotifier{

  String username = '';
  String email = '';
  String password = '';

  Future<void> signUp(String username, String email, String password) async {
    this.username = username;
    this.email = email;
    this.password = password;
    notifyListeners();

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setStringList(username, <String>[password, email]);

    await prefs.setString('currentUser', username);

  }

  Future<bool> signIn(String username, String password) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final List<String>? userData = prefs.getStringList(username);

    ///USER DOES NOT EXISTS
    if(userData==null){
      return false;
    }else
      ///WRONG PASSWORD
      if(password!=userData[0]){
        return false;
    }else{
        this.username = username;
        this.email = userData[1];
        this.password = password;
        notifyListeners();

        await prefs.setString('currentUser', username);

        return true;
      }


  }


  void logOut() async {
    this.username = '';
    this.email = '';
    this.password = '';
    notifyListeners();

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('currentUser');

  }


  @override
  void dispose() {

  }
}