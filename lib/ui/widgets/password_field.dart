import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../../auth/login_register/login_register_bloc.dart';
import '../../auth/login_register/login_register_event.dart';
import '../../auth/login_register/login_register_state.dart';



Widget passwordField() {
  return BlocBuilder<LoginRegisterBloc, LoginRegisterState>(
      builder: (context, state) {
        return TextFormField(
          decoration: InputDecoration(
              icon: Icon(Icons.security),
              hintText: 'Password'
          ),
          validator: (value) =>
          state.isValidPassword? null: 'Password is to short',
          onChanged: (value) =>
              context.read<LoginRegisterBloc>().add(
                  LoginRegisterPasswordChanged(password: value)
              ),
        );
      }
  );
}