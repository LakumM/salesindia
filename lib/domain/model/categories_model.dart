class CategoriesModel {
  String? id;
  String? name;
  String? status;
  String? created_at;
  String? updated_at;

  CategoriesModel(
      {required this.id,
      required this.status,
      required this.name,
      required this.created_at,
      required this.updated_at});

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
        id: json['id'],
        status: json['status'],
        name: json['name'],
        created_at: json['created_at'],
        updated_at: json['updated_at']);
  }
}
/* String? message;
  bool? status;
  List<DataModel>? data;

  CategoriesModel(
      {required this.status, required this.message, required this.data});

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    List<DataModel> data = [];
    for (Map<String, dynamic> eachData in json['data']) {
      var eachModel = DataModel.fromJson(eachData);
      data.add(eachModel);
    }
    print("$data");
    return CategoriesModel(
        status: json['status'], message: json['message'], data: data);
  }
}

class DataModel {*/
