import 'package:firebase_project/core/constants/colors_constant.dart';
import 'package:firebase_project/core/enums/text_form_enums.dart';
import 'package:firebase_project/core/extension/build_context_extension.dart';
import 'package:firebase_project/core/init/navigation/navigation_constants.dart';
import 'package:firebase_project/features/auth/login/login_view_model.dart';
import 'package:firebase_project/features/auth/register/register_view_model.dart';
import 'package:firebase_project/core/extension/regExp_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _confirmPasswordController =
      TextEditingController();

  late RegisterViewModel model;

  @override
  void initState() {
    model = RegisterViewModel();
    model.init();
    model.setContext(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String _elevatedButtonTitle = 'REGISTER';
    String _headLine = 'Register';

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back_ios))
                  ],
                ),
                SizedBox(
                  height: context.height * 0.10,
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
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 7.5),
                      child: TextFormField(
                          controller: _nameController,
                          validator: (email) {
                            if (email.isNullOrEmpty) {
                              return 'Please enter a name';
                            }
                            return null;
                          },
                          decoration: _InputDecoration(TextFormType.user)),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 7.5),
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
                        decoration: _InputDecoration(TextFormType.email),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 7.5),
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
                      padding: const EdgeInsets.symmetric(vertical: 7.5),
                      child: Consumer<LoginViewModel>(
                        builder: (context, value, child) {
                          return TextFormField(
                            validator: (confirmPassword) {
                              if (confirmPassword.isNullOrEmpty) {
                                return 'Please enter a password';
                              }
                              return null;
                            },
                            controller: _confirmPasswordController,
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
                              label: const Text('Confirm your password'),
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
                          onPressed();
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 20),
                          child: Text(_elevatedButtonTitle),
                        ),
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

  void onPressed() {
    var name = _nameController.text.trim();
    var email = _emailController.text.trim();
    var password = _passwordController.text.trim();
    var confirmPassword = _confirmPasswordController.text.trim();

    if (_formKey.currentState!.validate()) {
      if (password == confirmPassword) {
        model.registerUser(
          name,
          email,
          password,
        );
        model.navigationService.navigateToPage(NavigationConstant.home);
      } else {
        model.showSnackBarError();
      }
    }
  }

  InputDecoration _InputDecoration(TextFormType type) {
    return InputDecoration(
      filled: true,
      fillColor: ColorKit.whiteColor,
      focusedBorder: const OutlineInputBorder(),
      enabledBorder: const OutlineInputBorder(),
      prefixIcon: Icon(type.icon),
      label: Text(type.text),
    );
  }
}
