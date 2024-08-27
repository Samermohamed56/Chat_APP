import 'package:chattapp/Components/custem_button.dart';
import 'package:chattapp/Components/custem_text_field.dart';
import 'package:chattapp/Components/message.dart';
import 'package:chattapp/constant.dart';
import 'package:chattapp/screens/bloc/auth_bloc/auth_bloc.dart';
import 'package:chattapp/screens/chatPage.dart';
import 'package:chattapp/screens/chat_cubit/chat_cubit.dart';
import 'package:chattapp/screens/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;

  String? password;

  String? email;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          isLoading = true;
        } else if (state is LoginSuccess) {
          BlocProvider.of<ChatCubit>(context).getMessages();
          Navigator.pushReplacementNamed(context, ChatPage.id,
              arguments: email);
          isLoading = false;
        } else if (state is LoginFailure) {
          showSnack(context, state.errMessage);
          isLoading = false;
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Scaffold(
            backgroundColor: kPrimaryColor,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ListView(
                  children: [
                    const SizedBox(height: 30),
                    Center(
                      child: Image.asset(
                        "assets/images/scholar.png",
                        height: 100,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Center(
                      child: Text(
                        "Scholar Chat",
                        style: TextStyle(
                          fontFamily: 'Pacifico',
                          fontSize: 32,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      "Sign In",
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          CustemTextField(
                            isPassword: false,
                            hintText: 'Email',
                            onChanged: (data) {
                              email = data;
                            },
                          ),
                          const SizedBox(height: 15),
                          CustemTextField(
                            isPassword: true,
                            hintText: 'Password',
                            onChanged: (data) {
                              password = data;
                            },
                          ),
                          const SizedBox(height: 30),
                          CustemButton(
                            onTap: () async {
                              if (formKey.currentState!.validate()) {
                                BlocProvider.of<AuthBloc>(context).add(
                                    LoginEvent(
                                        email: email!, password: password!));
                              }
                            },
                            buttonText: 'Login',
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Don\'t have an account?  ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, Registerpage.id);
                                },
                                child: const Text(
                                  'Register',
                                  style: TextStyle(
                                    color: Colors.purpleAccent,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
