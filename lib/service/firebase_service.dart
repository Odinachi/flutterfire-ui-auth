import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class FirebaseService {
  static Future<void> signOut(BuildContext ctx) async {
    await FirebaseAuth.instance
        .signOut()
        .then(
            (value) async => await FirebaseAuth.instance.currentUser?.delete())
        .then((value) => ctx.go("/"));
  }
}
