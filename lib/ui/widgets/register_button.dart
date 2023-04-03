


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../auth/login_register/form_submission_status.dart';
import '../../auth/login_register/login_register_bloc.dart';
import '../../auth/login_register/login_register_event.dart';
import '../../auth/login_register/login_register_state.dart';
import '../../model/entities/user.dart';
import '../home_page.dart';

Widget registerButton(_formKey) {
  return BlocBuilder<LoginRegisterBloc, LoginRegisterState>(
      builder: (context, state) {
        return state.formStatus is FormSubmitting ?
        CircularProgressIndicator() :
        ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                context.read<LoginRegisterBloc>().add(RegisterSubmitted(
                  onSuccess: () {
                    Provider.of<LoginRegisterBloc>(context, listen: false);
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) {

                      return MultiProvider(providers: [
                        ChangeNotifierProvider(
                            create: (_) => context.watch<User>()),
                        BlocProvider(
                            create: (_) => Provider.of<LoginRegisterBloc>(context, listen: false))
                      ],
                        child: HomePage(),);
                    }));
                  },
                ));
              }
            },
            
            child: const Text('Register')
        );
      });


}