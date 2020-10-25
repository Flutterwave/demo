import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutterwave_demo_app/signup_request.dart';
import 'package:flutterwave_demo_app/network/authentication_service.dart';
import 'package:flutterwave_demo_app/utils.dart';
import 'package:flutterwave_demo_app/widgets/widget_utils.dart';
import 'package:http/http.dart' as http;

import 'login.dart';

class SignUpWidget extends StatefulWidget {
  @override
  _SignUpWidgetState createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          "Register",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: HexColor("F5A623"),
      ),
      body: Container(
        width: double.infinity,
        margin: EdgeInsets.fromLTRB(40, 20, 40, 0),
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
                height: 450,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextFormField(
                      controller: this._firstNameController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        labelText: "First Name",
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
                      validator: (value) =>
                          value.isEmpty ? "First Name is required" : null,
                    ),
                    TextFormField(
                      controller: this._lastNameController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.person,
                        ),
                        labelText: "Last Name",
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
                      validator: (value) =>
                          value.isEmpty ? "Last Name is required" : null,
                    ),
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
                      validator: (value) =>
                          value.isEmpty ? "Email is required" : null,
                    ),
                    TextFormField(
                      controller: this._phoneController,
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.phone),
                        labelText: "Phone Number",
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
                      validator: (value) =>
                          value.isEmpty ? "Phone number is required" : null,
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
                      validator: (value) =>
                          value.isEmpty ? "Password is required" : null,
                    ),
                    Container(
                      width: double.infinity,
                      height: 50,
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: RaisedButton(
                        onPressed: _handleRegisterButtonClick,
                        color: HexColor("F5A623"),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: Text(
                          "Register",
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
                        onTap: _openLoginPage,
                        child: Text(
                          "Already have an account? Sign in",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _handleRegisterButtonClick() {
    // if (_formKey.currentState.validate()) _registerUser();
    //
    RestaurantUtils.openHomePage(context);
  }

  _registerUser() async {
    final authService = AuthService(http.Client());
    final firstName = _firstNameController.text.trim();
    final lastName = _lastNameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final phoneNumber = _phoneController.text.trim();

    final SignUpRequest authBody = SignUpRequest(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
        phoneNumber: phoneNumber);
    // show loader
    try {
      final response = await authService.signUp(authBody);
      // hide loader
      print("signup response is $response");
      return RestaurantUtils.openHomePage(context);
    } catch (error) {
      WidgetUtils.showSnackBar(_scaffoldKey.currentState, error);
      // hide loader
    }
  }
  // hide loader
  void _openLoginPage() {
    RestaurantUtils.openNewScreenAndPopPreviousScreens(context, LoginWidget());
  }

}
