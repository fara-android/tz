import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tz/logic/auth/cubit/auth_cubit.dart';
import 'package:tz/screens/auth/components/login_form.dart';
import 'package:tz/screens/auth/components/text_widget.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        backgroundColor: Color(0xfff7f6fb),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 24, horizontal: 32),
            child: Column(
              children: [
                Spacer(),
                SizedBox(height: 18),
                TextWidget(),
                SizedBox(height: 24),
                LoginForm(),
                Spacer(),
                SizedBox(height: 20)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
