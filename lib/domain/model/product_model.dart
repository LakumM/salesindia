import 'dart:core';

class ProductModel {
  String? message;
  bool? status;
  List<PDataModel> data;

  ProductModel(
      {required this.data, required this.message, required this.status});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    List<PDataModel> pData = [];
    for (Map<String, dynamic> eachData in json['data']) {
      var eachModel = PDataModel.fromJson(eachData);
      pData.add(eachModel);
    }
    return ProductModel(
        data: pData, message: json['message'], status: json['status']);
  }
}

class PDataModel {
  num? id;
  String? name;
  String? price;
  String? image;
  num? category_id;
  num? status;
  String? created_at;
  String? updated_at;

  PDataModel(
      {required this.id,
      required this.status,
      required this.name,
      required this.updated_at,
      required this.created_at,
      required this.price,
      required this.category_id,
      required this.image});

  factory PDataModel.fromJson(Map<String, dynamic> jSon) {
    return PDataModel(
        id: jSon['id'],
        status: jSon['status'],
        name: jSon['name'],
        updated_at: jSon['updated_at'],
        created_at: jSon['created_at'],
        price: jSon['price'],
        category_id: jSon['category_id'],
        image: jSon['image']);
  }
}
