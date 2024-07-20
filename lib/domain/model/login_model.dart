class LoginSignupModel {
  bool? status;
  String? message;
  String? token;

  LoginSignupModel(
      {required this.status, required this.message, required this.token});

  factory LoginSignupModel.fromJson(Map<String, dynamic> jSon) {
    return LoginSignupModel(
        status: jSon['status'], message: jSon['message'], token: jSon['tokan']);
  }
}
