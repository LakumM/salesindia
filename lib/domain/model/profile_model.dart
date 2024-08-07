class ProfileModel {
  String? message;
  bool? status;
  List<ProfileDataModel>? data;
  ProfileModel(
      {required this.message, required this.status, required this.data});

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    List<ProfileDataModel> profilData = [];
    for (Map<String, dynamic> eachData in json['data']) {
      var eachModel = ProfileDataModel.formJson(eachData);
      profilData.add(eachModel);
    }
    return ProfileModel(
        message: json['message'], status: json['status'], data: profilData);
  }
}

class ProfileDataModel {
  String? created_at;
  String? email;
  String? id;
  String? image;
  String? mobile_number;
  String? name;
  String? password;
  String? status;
  String? updated_at;

  ProfileDataModel(
      {required this.created_at,
      required this.email,
      required this.id,
      required this.image,
      required this.mobile_number,
      required this.name,
      required this.password,
      required this.status,
      required this.updated_at});

  factory ProfileDataModel.formJson(Map<String, dynamic> jSon) {
    return ProfileDataModel(
        created_at: jSon['created_at'],
        email: jSon['email'],
        id: jSon['id'],
        image: jSon['image'],
        mobile_number: jSon['mobile_number'],
        name: jSon['name'],
        password: jSon['password'],
        status: jSon['status'],
        updated_at: jSon['updated_at']);
  }
}
