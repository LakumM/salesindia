class ProductModel {
  bool? status;
  String? message;
  List<ProDataModel>? data;

  ProductModel(
      {required this.data, required this.message, required this.status});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    List<ProDataModel> pData = [];
    for (Map<String, dynamic> eachData in json['data']) {
      var eachModel = ProDataModel.fromJson(eachData);
      pData.add(eachModel);
    }
    return ProductModel(
      message: json['message'],
      status: json['status'],
      data: pData,
    );
  }
}

class ProDataModel {
  String? id;
  String? name;
  String? price;
  String? image;
  String? categoryId;
  String? status;
  String? createdAt;
  String? updatedAt;

  ProDataModel(
      {required this.id,
      required this.status,
      required this.name,
      required this.updatedAt,
      required this.createdAt,
      required this.price,
      required this.categoryId,
      required this.image});

  factory ProDataModel.fromJson(Map<String, dynamic> jSon) {
    return ProDataModel(
        id: jSon['id'],
        status: jSon['status'],
        name: jSon['name'],
        updatedAt: jSon['updated_at'],
        createdAt: jSon['created_at'],
        price: jSon['price'],
        categoryId: jSon['category_id'],
        image: jSon['image']);
  }
}
