import 'package:firebase_project/features/splash/splash_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  late SplashViewModel model;

  @override
  void initState() {
    model = SplashViewModel.instance;
    model.setContext(context);
    model.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedOpacity(
          duration: const Duration(seconds: 2),
          opacity: context.watch<SplashViewModel>().opacity,
          onEnd: () {
            model.end();
          },
          child: const Icon(
            Icons.g_mobiledata,
            size: 100,
          ),
        ),
      ),
    );
  }
}
