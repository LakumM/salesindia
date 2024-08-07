/*
class ViewCartModel {
  bool? status;
  String? message;
  List<ViewCartDataModel>? data;

  ViewCartModel(
      {required this.status, required this.message, required this.data});

  factory ViewCartModel.fromJson(Map<String, dynamic> json) {
    List<ViewCartDataModel> viewData = [];
    for (Map<String, dynamic> eachData in json['data']) {
      var eachModel = ViewCartDataModel.fromJson(eachData);
      viewData.add(eachModel);
    }
    return ViewCartModel(
        status: json['status'], message: json['message'], data: viewData);
  }
}

class ViewCartDataModel {
  int? id;
  int? product_id;
  String? image;
  String? price;
  int? quantity;
  String? name;

  ViewCartDataModel(
      {required this.id,
      required this.product_id,
      required this.image,
      required this.price,
      required this.quantity,
      required this.name});

  factory ViewCartDataModel.fromJson(Map<String, dynamic> json) {
    return ViewCartDataModel(
        id: json['id'],
        product_id: json['product_id'],
        image: json['image'],
        price: json['price'],
        quantity: json['quantity'],
        name: json['name']);
  }
}
*/

class ViewCartModel {
  bool? status;
  String? message;
  List<ViewCartDataModel>? data;

  ViewCartModel({this.status, this.message, this.data});

  factory ViewCartModel.fromJson(Map<String, dynamic> json) {
    List<ViewCartDataModel> data = [];
    for (Map<String, dynamic> eachData in json['data']) {
      var eachModel = ViewCartDataModel.fromJson(eachData);
      data.add(eachModel);
    }
    return ViewCartModel(
        status: json['status'], message: json['message'], data: data);
  }
}

class ViewCartDataModel {
  int? id;
  int? productId;
  String? name;
  String? price;
  int? quant;
  /*String quantity;*/
  String? image;

  ViewCartDataModel(
      {required this.id,
      required this.productId,
      required this.name,
      required this.price,
      required this.quant,
      required this.image});

  factory ViewCartDataModel.fromJson(Map<String, dynamic> json) {
    return ViewCartDataModel(
        id: json['id'],
        productId: json['product_id'],
        name: json['name'],
        price: json['price'],
        quant: json['quantity'],
        image: json['image']);
  }
}
