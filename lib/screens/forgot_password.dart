import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
              icon: Icon(Icons.alternate_email),
              labelText: "Email",
            ),
            validator: (String? value) {
              if (value!.isEmpty) {
                return "Please input correct email.";
              }
              return null;
            },
          ),
          TextButton(
              onPressed: () async {
                await FirebaseAuth.instance
                    .sendPasswordResetEmail(email: _emailController.text);
                final snackBar = SnackBar(
                  content: Text("Check your email for password reset."),
                );
                ScaffoldMessenger.of(_formKey.currentContext!).showSnackBar(snackBar);
              },
              child: Text(
                "Reset password",
              ))
        ],
      ),
    ));
  }
}
