import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
              Navigator.pushNamedAndRemoveUntil(
                  context, "home", (route) => false);
            });
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
