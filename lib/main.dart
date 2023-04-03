import 'package:flutter/material.dart';
import 'package:flutter_test_app/ui/login_view.dart';
import 'package:flutter_test_app/ui/register_view.dart';
import 'package:flutter_test_app/ui/home_page.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth/login_register/login_register_bloc.dart';

import 'model/entities/user.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? currentUser = prefs.getString('currentUser');

  late User user;

  ///CHANGE TO MODIFY USER EARLIER AND MAKE JUST 1 CALL TO runAPP
  if(currentUser==null) {
    user = User();

  }
  else{
    final List<String>? items = prefs.getStringList(currentUser);
    user = User()
      ..username = currentUser
      ..password = items![0]
      ..email = items[1];


  }

  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => user),
    ],
        child: MyApp()),
  );
      //MyApp(currentUser: currentUser));
}


class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiProvider(providers: [
        ChangeNotifierProvider(create: (_) => context.read<User>()),
        BlocProvider(
          create: (BuildContext context) => LoginRegisterBloc(
              user: context.read<User>()
          ),
        ),
      ],
        child: context.read<User>().username=='' ?
        LoginView() :
        HomePage(),
      ),

      );
  }

}
