import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tz/logic/auth/cubit/auth_cubit.dart';
import 'package:tz/screens/publications/publications_screen.dart';
import 'package:tz/widgets/custom_button.dart';
import 'package:tz/widgets/custom_text_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          CustomTextField(
            controller: loginController,
            hintText: "Логин",
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: 6),
          CustomTextField(
            controller: passwordController,
            hintText: "Пароль",
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: 6),
          BlocListener<AuthCubit, AuthState>(
            listener: (context, state) {
              state.maybeWhen(
                orElse: () {},
                loaded: (success) {
                  if (success) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PublicationsScreen(),
                      ),
                    );
                  }
                },
                failed: (error) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.red,
                      content: SizedBox(
                        height: 24,
                        child: Center(
                          child: Text(error),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
            child: CustomButton(
              onTap: () async {
                if (loginController.text.isNotEmpty &&
                    passwordController.text.isNotEmpty) {
                  BlocProvider.of<AuthCubit>(context)
                      .login(loginController.text, passwordController.text);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.red,
                      content: SizedBox(
                        height: 24,
                        child: Center(
                          child: Text('Введите логин и пароль'),
                        ),
                      ),
                    ),
                  );
                }
              },
              buttonText: "Войти",
            ),
          )
        ],
      ),
    );
  }
}
