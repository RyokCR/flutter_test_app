
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main(){
  test('Can Create Preferences', () async{

    SharedPreferences.setMockInitialValues({}); //set values here
    SharedPreferences pref = await SharedPreferences.getInstance();
    String user = 'john';
    List<String> properties = ['password', 'email'];
    await pref.setString('currentUser', user);
    await pref.setStringList(user, properties);


    expect(pref.getString('currentUser'), 'john');
    expect(pref.getStringList('john'), ['password', 'email']);
  });
}