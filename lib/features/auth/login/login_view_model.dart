import 'package:firebase_project/core/base/base_view_model.dart';
import 'package:firebase_project/core/constants/colors_constant.dart';
import 'package:firebase_project/core/enums/cache_key_enum.dart';
import 'package:firebase_project/core/init/navigation/navigation_constants.dart';
import 'package:firebase_project/features/auth/login/login_service.dart';
import 'package:firebase_project/models/auth/user_request.dart';
import 'package:flutter/material.dart';

class LoginViewModel extends BaseViewModel {
  // LoginViewModel._();

  // static final LoginViewModel _instance = LoginViewModel._();
  // static LoginViewModel get instance => _instance;

  @override
  void init() {}

  @override
  void setContext(BuildContext context) => this.context = context;

  bool visiblePassword = false;
  final LoginService _service = LoginService();

  void isTrue() {
    visiblePassword = !visiblePassword;
    notifyListeners();
  }

  void login(String email, String password) async {
    final userRequest = UserRequest(email, password);
    final either = await _service.login(userRequest);
    either.fold(
      (user) async {
        await cacheManager.saveString(CacheKeys.userUID, user!.uid);
        navigationService.navigateToPageClear(NavigationConstant.home);
      },
      (e) => _showSnackBarError(),
    );
  }

  void _showSnackBarError() {
    ScaffoldMessenger.of(context!).showSnackBar(
      const SnackBar(
        backgroundColor: ColorKit.redColor,
        content: Text('Email or password is not correct'),
      ),
    );
  }

  void navigateToHome() {
    navigationService.navigateToPageClear(NavigationConstant.home);
  }

  void navigateToRegister() {
    navigationService.navigateToPage(NavigationConstant.register);
  }
}
