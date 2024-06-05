import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hopehub/data/Model/user_model.dart';
import 'package:hopehub/data/firebase/db_controller.dart';
import 'package:hopehub/presentation/widget/custome_snackbar.dart';

class AuthenctionUser {
  var _auth = FirebaseAuth.instance;
  DbController controller = DbController();
  Future registerAUser(
      context, String email, String password, UserModel userModel) async {
    try {
       _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        controller.addUser(userModel, value.user!.uid);
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
         CSnackBar.showErrorSnack(context, 'Weak password');
      } else if (e.code == 'email-already-in-use') {
         CSnackBar.showErrorSnack(context, 'E-mail is already in use');
      } else {
         CSnackBar.showErrorSnack(context, e.code.toString());
      }
    }
  }
}
