import 'package:firebase_project/core/base/base_view_model.dart';
import 'package:firebase_project/core/enums/cache_key_enum.dart';
import 'package:firebase_project/core/init/navigation/navigation_constants.dart';
import 'package:flutter/material.dart';

class SplashViewModel extends BaseViewModel {
  SplashViewModel._();

  static final SplashViewModel _instance = SplashViewModel._();
  static SplashViewModel get instance => _instance;

  @override
  Future<void> init() async {
    await changeOpacity();
    notifyListeners();
  }

  @override
  void setContext(BuildContext context) => this.context = context;

  double opacity = 0;

  Future<void> changeOpacity() async {
    await Future.delayed(const Duration(seconds: 2));
    opacity = 1;
    notifyListeners();
  }

  void end() async {
    cacheManager.getString(CacheKeys.userUID);

    if (CacheKeys.userUID.name.isEmpty) {
      navigationService.navigateToPage(NavigationConstant.login);
    } else {
      navigationService.navigateToPageClear(NavigationConstant.home);
    }

    notifyListeners();
  }
}
