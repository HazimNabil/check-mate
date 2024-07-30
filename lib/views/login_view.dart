import 'package:check_mate/constants.dart';
import 'package:check_mate/services/auth_service.dart';
import 'package:check_mate/views/home_view.dart';
import 'package:check_mate/views/register_view.dart';
import 'package:check_mate/widgets/auth_switch_prompt.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../helper/auth_validation.dart';
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

  void login() async {
    if (formKey.currentState!.validate()) {
      FocusScope.of(context).requestFocus(FocusNode());
      setState(() => isLoading = true);
      try {
        await AuthService().login(email, password);
        if (mounted) {
          showSnackBar(context, 'Welcome back, old friend');
          Navigator.pushReplacementNamed(context, HomeView.route);
        }
      } on FormatException catch (e) {
        if (mounted) showSnackBar(context, e.message);
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
                'Login',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 130),
              CustomTextField(
                hint: 'Email',
                onChanged: (value) => email = value,
                validator: validateEmail,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                hint: 'Password',
                onChanged: (value) => password = value,
                validator: validatePassword,
                obscureText: true,
              ),
              const SizedBox(height: 50),
              AuthButton(
                title: 'Login',
                onPressed: login,
              ),
              const SizedBox(height: 15),
              AuthSwitchPrompt(
                promptText: "Don't have account? ",
                actionText: 'Register here',
                onTap: () => Navigator.pushNamed(context, RegisterView.route),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
