import 'package:flutter/material.dart';
import 'package:untitled1/data/JoinOrLogin.dart';
import 'package:untitled1/util/login_background.dart';
import 'package:provider/provider.dart';

class AuthPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          CustomPaint(
            size: size,
            painter: LoginBackground(
                isJoin: Provider.of<JoinOrLogin>(context).isJoin),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _loadImage(),
              Stack(
                alignment: Alignment.centerLeft,
                children: <Widget>[
                  _inputForm(size),
                  _authButton(size),
                ],
              ),
              Container(
                height: size.height * 0.1,
              ),
              Consumer<JoinOrLogin>(
                builder: (context, value, child) => GestureDetector(
                  onTap: () {
                    value.toggle();
                  },
                  child: Center(
                      child: Text(
                    value.isJoin
                        ? "Already have an account, sign in"
                        : "Don't have an account? Create one",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: value.isJoin ? Colors.red : Colors.blue),
                  )),
                ),
              ),
              Container(
                height: size.height * 0.05,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _authButton(Size size) {
    return Positioned(
      left: size.width * 0.15,
      right: size.width * 0.15,
      bottom: 0,
      child: SizedBox(
          height: 50,
          child: Consumer<JoinOrLogin>(
            builder: (context, value, child) => ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // 2개의 validator에 대한 처리를 진행
                  print(_emailController.text);
                  print(_passwordController.text);
                }
              },
              child: Text(
                value.isJoin ? "Join" : "Login",
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
              style: ElevatedButton.styleFrom(
                primary: value.isJoin ? Colors.red : Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
              ),
            ),
          )),
    );
  }

  Widget _loadImage() {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.only(top: 50, left: 24, right: 24),
      child: FittedBox(
        fit: BoxFit.contain,
        child: CircleAvatar(
          backgroundImage: AssetImage("assets/doge.jpg"),
        ),
      ),
    ));
  }

  Widget _inputForm(Size size) {
    return Padding(
      padding: EdgeInsets.all(size.width * 0.05),
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 12, right: 12, top: 12, bottom: 32),
          child: Form(
              key: _formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                          icon: Icon(Icons.account_circle), labelText: "Email"),
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Please input correct email.";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      controller: _passwordController,
                      decoration: InputDecoration(
                        icon: Icon(Icons.vpn_key),
                        labelText: "Password",
                      ),
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Please input correct password.";
                        }
                        return null;
                      },
                    ),
                    Container(
                      height: 8,
                    ),
                    Consumer<JoinOrLogin>(
                      builder: (context, value, child) => Opacity(
                        opacity: value.isJoin ? 0 : 1,
                        child: Center(
                          child: Text(
                            "Forgot Password",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    )
                  ])),
        ),
      ),
    );
  }
}
