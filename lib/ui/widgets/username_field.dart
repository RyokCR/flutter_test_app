
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../../auth/login_register/login_register_bloc.dart';
import '../../auth/login_register/login_register_event.dart';
import '../../auth/login_register/login_register_state.dart';

Widget usernameField() {
  return BlocBuilder<LoginRegisterBloc, LoginRegisterState>(
      builder: (context, state) {
        return TextFormField(
          decoration: InputDecoration(
              icon: Icon(Icons.person),
              hintText: 'Username'
          ),
          validator: (value) =>
          state.isValidUsername? null: 'Username is to short',
          onChanged: (value) =>
              context.read<LoginRegisterBloc>().add(
                  LoginRegisterUsernameChanged(username: value)
              ),
        );

      }
  );
}