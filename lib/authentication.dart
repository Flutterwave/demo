class Authentication {
  String firstName;
  String lastName;
  String email;
  String password;
  String country = "Nigeria";
  String phoneNumber;

  Authentication({this.firstName, this.lastName, this.email, this.password, this.phoneNumber});

  Authentication.fromJson(final Map json) {
    this.firstName = json["f_name"];
    this.lastName = json["l_name"];
    this.email = json["email"];
    this.password = json["password"];
    this.country = json["country"] == null ? "Nigeria" : json["country"];
    this.phoneNumber = json["phone"];
  }

  toJson() {
    return {
      "f_name": this.firstName,
      "l_name": this.lastName,
      "email": this.email,
      "password": this.password,
      "country": this.country,
      "phone": this.phoneNumber
    };
  }
}
