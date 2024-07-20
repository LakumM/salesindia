abstract class SignupEvent {}

class SignupUser extends SignupEvent {
  String? name;
  String? mobile_number;
  String? email;
  String? password;

  SignupUser(
      {required this.name,
      required this.email,
      required this.mobile_number,
      required this.password});
}
