class LoginRequest {
  String email;
  String password;

  LoginRequest({this.email, this.password});

  LoginRequest.fromJson(final Map json) {
    this.email = json["email"];
    this.password = json["password"];
  }

  toJson() {
    return {
      "email": this.email,
      "password": this.password,
    };
  }
}
