abstract class SignupEvent {}

class SignupUser extends SignupEvent {
  String? name;
  String? mobile_Number;
  String? email;
  String? password;

  SignupUser(
      {required this.name,
      required this.email,
      required this.mobile_Number,
      required this.password});
}
