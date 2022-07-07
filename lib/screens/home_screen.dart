import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              user?.email ?? '',
              style: const TextStyle(fontSize: 20),
            ),
            TextButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut().then(
                      (value) => context.go("/"),
                    );
              },
              child: const Text('Logout'),
            )
          ],
        ),
      ),
    );
  }
}
