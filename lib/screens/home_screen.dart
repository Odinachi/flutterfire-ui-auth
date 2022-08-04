import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_test/service/firebase_service.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () async {
                    await FirebaseService.signOut(context);
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "Delete Account",
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    user?.email ?? '',
                    style: const TextStyle(fontSize: 20),
                  ),
                  TextButton(
                    onPressed: () async {
                      await FlutterFireUIAuth.signOut()
                          .then((value) => context.go("/"));
                    },
                    child: const Text('Logout'),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
