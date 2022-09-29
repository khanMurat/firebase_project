import 'package:firebase_project/core/constants/colors_constant.dart';
import 'package:firebase_project/core/enums/text_form_enums.dart';
import 'package:firebase_project/core/extension/build_context_extension.dart';
import 'package:firebase_project/core/extension/regExp_extension.dart';
import 'package:firebase_project/features/auth/login/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  late LoginViewModel model;

  @override
  void initState() {
    model = LoginViewModel();
    model.init();
    model.setContext(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String _elevatedButtonTitle = 'LOGIN';
    String _headLine = 'Log in';
    String _title = 'Welcome';

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_back_ios))
                  ],
                ),
                SizedBox(
                  height: context.height * 0.1,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2.5),
                      child: Text(
                        _headLine,
                        style: context.textTheme.titleLarge,
                      ),
                    ),
                    Text(
                      _title,
                      style: context.textTheme.caption,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30.0),
                      child: TextFormField(
                        controller: _emailController,
                        validator: (email) {
                          if (email.isNullOrEmpty) {
                            return 'Please enter an email';
                          } else if (!email!.isValidEmail) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: ColorKit.whiteColor,
                          focusedBorder: const OutlineInputBorder(),
                          enabledBorder: const OutlineInputBorder(),
                          prefixIcon: Icon(TextFormType.email.icon),
                          hintText: TextFormType.email.text,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Consumer<LoginViewModel>(
                        builder: (context, value, child) {
                          return TextFormField(
                            validator: (password) {
                              if (password.isNullOrEmpty) {
                                return 'Please enter a password';
                              } else if (!password!.isLength(6)) {
                                return 'Your password must be at least 6 character';
                              } else if (password.isValidPassword) {
                                return 'Please enter a valid password';
                              }
                              return null;
                            },
                            controller: _passwordController,
                            obscureText: value.visiblePassword,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: ColorKit.whiteColor,
                              focusedBorder: const OutlineInputBorder(),
                              enabledBorder: const OutlineInputBorder(),
                              prefixIcon: IconButton(
                                icon: value.visiblePassword
                                    ? Icon(TextFormType.lockPassword.icon)
                                    : Icon(TextFormType.unLockpassword.icon),
                                onPressed: () {
                                  value.isTrue();
                                },
                              ),
                              label: Text(TextFormType.lockPassword.text),
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 50.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                        ),
                        onPressed: () {
                          var email = _emailController.text.trim();
                          var password = _passwordController.text.trim();

                          if (_formKey.currentState!.validate()) {
                            model.login(email, password);
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 20),
                          child: Text(_elevatedButtonTitle),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: model.navigateToRegister,
                      child: const Text(
                        'Register',
                        style: const TextStyle(color: ColorKit.blackColor),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
