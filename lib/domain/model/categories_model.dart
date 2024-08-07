class CategoriesModel {
  bool? status;
  String? message;
  List<DataModel>? data;

  CategoriesModel(
      {required this.status, required this.message, required this.data});

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    List<DataModel> dataModel = [];
    for (Map<String, dynamic> eachData in json['data']) {
      var eachModel = DataModel.fromJson(eachData);
      dataModel.add(eachModel);
    }
    return CategoriesModel(
        status: json['status'], message: json['message'], data: dataModel);
  }
}

class DataModel {
  String? id;
  String? name;
  String? status;
  String? createdAt;
  String? updatedAt;

  DataModel(
      {required this.id,
      required this.name,
      required this.status,
      required this.createdAt,
      required this.updatedAt});

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
        id: json['id'],
        name: json['name'],
        status: json['status'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at']);
  }
}
