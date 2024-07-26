import 'package:check_mate/views/home_view.dart';
import 'package:check_mate/views/login_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../constants.dart';
import '../helper/show_snack_bar.dart';
import '../widgets/auth_button.dart';
import '../widgets/custom_text_field.dart';

class RegisterView extends StatefulWidget {
  static String route = 'register_view';

  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  String? email, password, confirmedPassword;
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;
  var autovalidateMode = AutovalidateMode.disabled;

  void register() async {
    if (formKey.currentState!.validate()) {
      FocusScope.of(context).requestFocus(FocusNode());
      setState(() => isLoading = true);
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email!,
          password: password!,
        );
        if (mounted) {
          showSnackBar(
            context,
            'Registration completed successfully! Welcome aboard!',
          );
          Navigator.pushReplacementNamed(context, HomeView.route);
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          if (mounted) {
            showSnackBar(
              context,
              'The provided password is too weak',
            );
          }
        } else if (e.code == 'email-already-in-use') {
          if (mounted) {
            showSnackBar(
              context,
              'The provided email is already used',
            );
          }
        }
      } catch (e) {
        if (mounted) {
          showSnackBar(context, e.toString());
        }
      }
      setState(() => isLoading = false);
    } else {
      setState(() => autovalidateMode = AutovalidateMode.always);
    }
  }

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
                'Register',
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
              const SizedBox(height: 20),
              CustomTextField(
                hint: 'Confirm Password',
                onChanged: (value) {
                  confirmedPassword = value;
                },
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'This field is required';
                  } else if (confirmedPassword != password) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
                obscureText: true,
              ),
              const SizedBox(height: 50),
              AuthButton(
                title: 'Register',
                onPressed: register,
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
                      Navigator.pushNamed(context, LoginView.route);
                    },
                    child: const Text(
                      'Login here',
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
