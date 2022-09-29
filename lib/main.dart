import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_project/core/init/cache/cache_manager.dart';
import 'package:firebase_project/core/init/navigation/navigation_manager.dart';
import 'package:firebase_project/core/init/navigation/navigation_service.dart';
import 'package:firebase_project/features/auth/login/login_view_model.dart';
import 'package:firebase_project/features/share/share_post_view_model.dart';
import 'package:firebase_project/features/splash/splash_view_model.dart';
import 'package:firebase_project/ui/theme/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CacheManager.instance.preferencesInit;
  runApp(const FirebaseApp());
}

class FirebaseApp extends StatelessWidget {
  const FirebaseApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SplashViewModel.instance),
        ChangeNotifierProvider(create: (context) => LoginViewModel()),
        ChangeNotifierProvider(create: (context) => SharePostViewModel.instance)
      ],
      builder: (context, child) {
        return MaterialApp(
            theme: CustomTheme.instance.theme,
            debugShowCheckedModeBanner: false,
            navigatorKey: NavigationService.instance.navigatorKey,
            onGenerateRoute: NavigationManager.instance.generateRoute);
      },
    );
  }
}
