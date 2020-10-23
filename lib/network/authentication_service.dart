import 'dart:convert';

import 'package:flutterwave_demo_app/authentication.dart';
import 'package:http/http.dart' as http;
class AuthService {
  http.Client client;

  AuthService(this.client);

  static const _baseUrl = "https://flutterwave-api-endpoints.herokuapp.com/api/";
  static const _signUpUrl = "v1/auth/signup";
  static const _loginUrl = "v1/auth/signin";

  Future<dynamic> signUp(final Authentication authBody) async {
    final url = _baseUrl + _signUpUrl;
      final response = await client.post(url, body: authBody.toJson());
      if (response.statusCode == 201) return jsonDecode(response.body);
      throw Exception(response.body);
  }

  Future<dynamic> login(final Authentication authBody) async {
    final url = _baseUrl + _loginUrl;
    final response = await client.post(url, body: authBody.toJson());
    if (response.statusCode == 201) return jsonDecode(response.body);
    throw Exception(response.body);
  }
}