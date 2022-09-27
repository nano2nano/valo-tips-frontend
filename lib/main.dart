import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:valo_tips/check_login.dart';
import 'package:valo_tips/firebase_options.dart';
import 'package:valo_tips/first_view.dart';

import 'view/login/login_view.dart';
import 'view/post_tip/post_tip_view.dart';
import 'view/search_tip/search_tip_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Valo Tips',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        "/": (context) => dotenv.env['checkLogin'] == 'true'
            ? const CheckLogin()
            : const FirstView(),
        "/login": (context) => const LoginView(),
        "/tips": (context) => const SearchTipView(),
        "/post": (context) => const PostTipView(),
      },
      navigatorObservers: [observer],
    );
  }
}
