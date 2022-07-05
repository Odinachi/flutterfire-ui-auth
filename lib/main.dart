import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_test/firebase_options.dart';
import 'package:flutterfire_test/screens/auth_screen.dart';
import 'package:flutterfire_test/screens/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static User? user = FirebaseAuth.instance.currentUser;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: user?.email == null ? "/" : "home",
      routes: {
        "/": (context) => const AuthScreen(),
        "home": (context) => const HomeScreen(),
      },
      // home: HomeScreen(),
    );
  }
}
