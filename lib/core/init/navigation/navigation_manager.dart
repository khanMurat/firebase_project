import 'package:firebase_project/core/init/navigation/navigation_constants.dart';
import 'package:firebase_project/features/auth/login/login_view.dart';
import 'package:firebase_project/features/auth/register/register_view.dart';
import 'package:firebase_project/features/home/home_view.dart';
import 'package:firebase_project/features/notFound/not_found_view.dart';
import 'package:firebase_project/features/share/share_post_view.dart';
import 'package:firebase_project/features/splash/splash_view.dart';
import 'package:firebase_project/cache-sample/cache_view.dart';
import 'package:flutter/material.dart';

class NavigationManager {
  NavigationManager._init();

  static final NavigationManager _instance = NavigationManager._init();
  static NavigationManager get instance => _instance;

  Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case NavigationConstant.splash:
        return navigate(NavigationConstant.splash, const SplashView());
      case NavigationConstant.welcome:
        return navigate(NavigationConstant.welcome, const CacheView());
      case NavigationConstant.login:
        return navigate(NavigationConstant.login, const LoginView());
      case NavigationConstant.register:
        return navigate(NavigationConstant.register, const RegisterView());
      case NavigationConstant.home:
        return navigate(NavigationConstant.home, const HomeView());
      case NavigationConstant.share:
        return navigate(NavigationConstant.share, const ShareView());
      default:
        return navigate(NavigationConstant.notFound, const NotFoundView());
    }
  }

  MaterialPageRoute? navigate(String path, Widget view, {Object? data}) {
    return MaterialPageRoute(
      builder: ((context) => view),
      settings: RouteSettings(name: path, arguments: data),
    );
  }
}
