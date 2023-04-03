import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_app/ui/login_view.dart';

import 'package:provider/provider.dart';

import '../auth/login_register/login_register_event.dart';
import '../auth/login_register/login_register_bloc.dart';
import '../model/entities/user.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          const Center(child:Text('LogOut')),
          IconButton(

            onPressed: () {
              context.read<LoginRegisterBloc>().add(LogoutRequested());

              Provider.of<LoginRegisterBloc>(context, listen: false);
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) {

                return MultiProvider(providers: [
                  ChangeNotifierProvider(create: (_) => context.watch<User>()),
                  BlocProvider(create: (_) => Provider.of<LoginRegisterBloc>(context, listen: false))
                ],
                  child: LoginView(),);
              }));

            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 100,),
          const Text('Welcome',
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.black
              )
          ),
          Consumer<User>(
            builder: (_, user, __) => Text(user.username,
                style: const TextStyle(
                    fontSize: 30,
                    color: Colors.black
                )
            )
          ),
    Consumer<User>(
    builder: (_, user, __) => Text(user.email,
    style: const TextStyle(
    fontSize: 30,
    color: Colors.black
    )
    )
    ),
        ],
      ))
    );
  }
}
