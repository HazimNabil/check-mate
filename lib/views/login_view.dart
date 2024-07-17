import 'package:check_mate/constants.dart';
import 'package:check_mate/views/register_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../helper/show_snack_bar.dart';
import '../widgets/auth_button.dart';
import '../widgets/custom_text_field.dart';

class LoginView extends StatefulWidget {
  static String route = 'login_view';

  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  String? email, password;
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;
  var autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      progressIndicator: const CircularProgressIndicator(
        color: kPrimaryColor,
      ),
      inAsyncCall: isLoading,
      child: Scaffold(
        body: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Login',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 130),
              CustomTextField(
                hint: 'Email',
                onChanged: (value) {
                  email = value;
                },
                validator: (value) {
                  final emailPattern = RegExp(
                    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                  );
                  if (value?.isEmpty ?? true) {
                    return 'This field is required';
                  } else if (!emailPattern.hasMatch(value!)) {
                    return 'This is not valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              CustomTextField(
                hint: 'Password',
                onChanged: (value) {
                  password = value;
                },
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'This field is required';
                  }
                  return null;
                },
                obscureText: true,
              ),
              const SizedBox(height: 50),
              AuthButton(
                title: 'Login',
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    setState(() => isLoading = true);
                    try {
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: email!,
                        password: password!,
                      );
                      showSnackBar(
                        context,
                        'Login successful! Welcome back!',
                      );
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'invalid-credential') {
                        showSnackBar(
                          context,
                          'Invalid credentials. Please double-check your email and password, and try again',
                        );
                      } else {
                        showSnackBar(context, e.code);
                      }
                    } catch (e) {
                      showSnackBar(context, e.toString());
                    }
                    setState(() => isLoading = false);
                  } else {
                    setState(() => autovalidateMode = AutovalidateMode.always);
                  }
                },
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have account? ",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RegisterView.route);
                    },
                    child: const Text(
                      'Register here',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
