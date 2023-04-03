import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_app/auth/login_register/login_register_bloc.dart';
import 'package:flutter_test_app/ui/widgets/email_field.dart';
import 'package:flutter_test_app/ui/widgets/password_field.dart';
import 'package:flutter_test_app/ui/widgets/register_button.dart';
import 'package:flutter_test_app/ui/widgets/username_field.dart';
import 'package:provider/provider.dart';

import '../model/entities/user.dart';

class RegisterView extends StatelessWidget {
  RegisterView({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Please Enter Your Data'),
          actions: [],
        ),
        body: BlocProvider(
          create: (BuildContext context) => LoginRegisterBloc(
              user: context.read<User>()
          ),
          child: _registerForm(),
        )
    );
  }



  Widget _registerForm(){
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            usernameField(),
            passwordField(),
            emailField(),
            registerButton(_formKey)
          ],
        ),
      ),
    );
  }

}
