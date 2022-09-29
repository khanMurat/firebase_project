import 'package:firebase_project/core/base/base_view_model.dart';
import 'package:firebase_project/core/constants/colors_constant.dart';
import 'package:firebase_project/core/enums/cache_key_enum.dart';
import 'package:firebase_project/core/init/navigation/navigation_constants.dart';
import 'package:firebase_project/features/auth/register/register_service.dart';
import 'package:firebase_project/models/auth/user_data.dart';
import 'package:firebase_project/models/auth/user_request.dart';
import 'package:flutter/material.dart';

class RegisterViewModel extends BaseViewModel {
  @override
  void init() {}

  @override
  void setContext(BuildContext context) => this.context = context;

  final RegisterService _registerService = RegisterService();

  void registerUser(String name, email, password) async {
    final userRequest = UserRequest(email, password);
    final either = await _registerService.createuser(userRequest);

    either.fold(
      (user) async {
        await cacheManager.saveString(CacheKeys.userUID, user.uid);
        final userUID = cacheManager.getString(CacheKeys.userUID);
        final userData = UserData(userUID, name, true);
        await _registerService.userData(userData);
        navigationService.navigateToPageClear(NavigationConstant.home);
      },
      (e) => unexpectedSnackBarError(),
    );
  }

  void showSnackBarError() {
    ScaffoldMessenger.of(context!).showSnackBar(
      const SnackBar(
        backgroundColor: ColorKit.redColor,
        content: Text('Passwords are not same'),
      ),
    );
  }

  void unexpectedSnackBarError() {
    ScaffoldMessenger.of(context!).showSnackBar(
      const SnackBar(
        content: Text('Unexpected error has occured'),
      ),
    );
  }
}
