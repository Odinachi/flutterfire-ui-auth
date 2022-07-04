import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            return Center(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  snapshot.data?.email ?? '',
                  style: const TextStyle(fontSize: 20),
                ),
                TextButton(
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut();
                    },
                    child: const Text('Logout'))
              ],
            ));
          }

          return const SignInScreen(
            oauthButtonVariant: OAuthButtonVariant.icon,
            resizeToAvoidBottomInset: true,
            providerConfigs: [
              EmailProviderConfiguration(),
            ],
          );
        },
      ),
    );
  }
}
