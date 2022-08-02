import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:go_router/go_router.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SignInScreen(
      oauthButtonVariant: OAuthButtonVariant.icon_and_text,
      resizeToAvoidBottomInset: true,
      providerConfigs: [
        const EmailProviderConfiguration(),
        GoogleProviderConfiguration(
          clientId: dotenv.get("GOOGLE_KEY", fallback: ""),
        )
      ],
      actions: [
        AuthStateChangeAction((context, AuthState state) {
          if (state is SignedIn) {
            context.go("/home");
          }
        })
      ],
    );
  }
}
