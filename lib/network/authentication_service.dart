import 'dart:convert';

import 'package:flutterwave_demo_app/models/flw_error.dart';
import 'package:flutterwave_demo_app/signup_request.dart';
import 'package:http/http.dart' as http;

import '../login_request.dart';
class AuthService {
  http.Client client;

  AuthService(this.client);

  static const _baseUrl = "https://flutterwave-api-endpoints.herokuapp.com/api/";
  static const _signUpUrl = "v1/auth/signup";
  static const _loginUrl = "v1/auth/signin";

  Future<dynamic> signUp(final SignUpRequest request) async {
    final url = _baseUrl + _signUpUrl;
      final response = await client.post(url, body: request.toJson());
      if (response.statusCode == 201) return jsonDecode(response.body);
      throw FLWError.networkError(jsonDecode(response.body));
  }

  Future<dynamic> login(final LoginRequest request) async {
    final url = _baseUrl + _loginUrl;
    final response = await client.post(url, body: request.toJson());
    if (response.statusCode == 200) return jsonDecode(response.body);
    throw FLWError.networkError(jsonDecode(response.body));
  }
}