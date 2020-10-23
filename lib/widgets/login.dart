import 'package:flutter/material.dart';
import 'package:flutterwave_demo_app/utils.dart';
import 'package:flutterwave_demo_app/widgets/signup.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutterwave_demo_app/authentication.dart';
import 'package:flutterwave_demo_app/network/authentication_service.dart';

class LoginWidget extends StatefulWidget {
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: HexColor("F5A623"),
      ),
      body: Container(
        width: double.infinity,
        margin: EdgeInsets.fromLTRB(40, 50, 40, 0),
        child: Column(
          children: [
            Container(
              height: 70,
              margin: EdgeInsets.fromLTRB(40, 0, 40, 20),
              child: Image.asset("images/flutterwave.png"),
            ),
            Form(
              key: this._formKey,
              child: Container(
                height: 260,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextFormField(
                      controller: this._emailController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        labelText: "Email",
                        labelStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: HexColor("F8F8F9")),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: HexColor("6272C1")),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: HexColor("DB000C")),
                        ),
                      ),
                      validator: (value) => value.isEmpty ? "Email is required" : null,
                    ),
                    TextFormField(
                      controller: this._passwordController,
                      obscureText: true,
                      obscuringCharacter: "*",
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.remove_red_eye_rounded),
                        labelText: "Password",
                        labelStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: HexColor("F8F8F9")),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: HexColor("6272C1")),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: HexColor("DB000C")),
                        ),
                      ),
                      validator: (value) => value.isEmpty ? "Password is required" : null,
                    ),
                    Container(
                      width: double.infinity,
                      height: 50,
                      child: RaisedButton(
                        onPressed: _handleLoginButtonClick,
                        color: HexColor("F5A623"),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: Text(
                          "Login",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ),
                    Container(
                      child: GestureDetector(
                        onTap: _openSignUpPage,
                        child: Text(
                          "New? Register here",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        )
      ),
    );
  }

  _handleLoginButtonClick() {
    // if (_formKey.currentState.validate()) _logUserIn();
    RestaurantUtils.openHomePage(context);
  }

  _logUserIn() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    final authService = AuthService(http.Client());

    final Authentication authBody = Authentication(
        email: email,
        password: password);
    // show loader
    try {
      final response = await authService.signUp(authBody);
      print("login response is $response");
      // hide loader
    } catch (exception) {
      // hide loader
    }
  }

  void _openSignUpPage() {
    RestaurantUtils.openNewScreenAndPopPreviousScreens(this.context, SignUpWidget());
  }
}
