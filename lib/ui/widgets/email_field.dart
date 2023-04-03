import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../auth/login_register/login_register_bloc.dart';
import '../../auth/login_register/login_register_event.dart';
import '../../auth/login_register/login_register_state.dart';



Widget emailField() {
  return BlocBuilder<LoginRegisterBloc, LoginRegisterState>(
      builder: (context, state) {
        return TextFormField(
          decoration: InputDecoration(
              icon: Icon(Icons.email),
              hintText: 'Email'
          ),
          validator: (value) =>
          state.isValidPassword? null: 'Email is to short',
          onChanged: (value) =>
              context.read<LoginRegisterBloc>().add(
                  LoginRegisterEmailChanged(email: value)
              ),
        );
      }
  );
}