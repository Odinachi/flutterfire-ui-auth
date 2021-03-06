import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_test/firebase_options.dart';
import 'package:flutterfire_test/screens/auth_screen.dart';
import 'package:flutterfire_test/screens/home_screen.dart';
import 'package:flutterfire_test/screens/verify_email_screen.dart';
import 'package:go_router/go_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
    );
  }
}

final GoRouter router = GoRouter(
  //checks for the initial page to show the user based on the user details
  initialLocation: FirebaseAuth.instance.currentUser?.email == null
      ? "/"
      : FirebaseAuth.instance.currentUser?.emailVerified == true
          ? "/verify_email"
          : "/home",
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) =>
          const AuthScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (BuildContext context, GoRouterState state) =>
          const HomeScreen(),
    ),
    GoRoute(
      path: '/verify_email',
      builder: (BuildContext context, GoRouterState state) =>
          const VerifyEmailScreen(),
    ),
  ],
);
