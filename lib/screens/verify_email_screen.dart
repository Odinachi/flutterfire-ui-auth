import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:go_router/go_router.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EmailVerificationScreen(
      actions: [
        //this callback is called immediately email is verified
        EmailVerified(() {
          context.go("/home");
        }),
      ],
    );
  }
}
