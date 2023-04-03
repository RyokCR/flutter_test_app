
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_app/auth/login_register/form_submission_status.dart';
import 'package:flutter_test_app/auth/login_register/login_register_bloc.dart';
import 'package:flutter_test_app/auth/login_register/login_register_event.dart';
import 'package:flutter_test_app/auth/login_register/login_register_state.dart';
import 'package:flutter_test_app/ui/register_view.dart';
import 'package:flutter_test_app/ui/home_page.dart';
import 'package:flutter_test_app/ui/widgets/login_button.dart';
import 'package:flutter_test_app/ui/widgets/password_field.dart';
import 'package:flutter_test_app/ui/widgets/username_field.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/entities/user.dart';

class LoginView extends StatelessWidget {
   LoginView({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => context.read<User>()),

    ],
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Please Log in'),
            actions: [
              Center(child:Text('Register')),
              IconButton(

                  onPressed: () =>
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) =>
                          MultiProvider(providers: [
                            ChangeNotifierProvider(create: (_) => context.read<User>()),
                          ],
                            child: RegisterView()
                          )
                      )
                      ),

                  icon: Icon(Icons.app_registration))
            ],
          ),
          body: _loginForm()
      ));


  }



   Widget _loginForm(){
     return Form(
       key: _formKey,
       child: Padding(
         padding: EdgeInsets.symmetric(horizontal: 40),
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             usernameField(),
             passwordField(),
             loginButton(_formKey)
           ],
         ),
       ),
     );
   }


}
