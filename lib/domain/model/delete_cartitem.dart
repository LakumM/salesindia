class DeleteCartItemModel {
  bool? status;
  String? message;

  DeleteCartItemModel({required this.message, required this.status});

  factory DeleteCartItemModel.fromJson(Map<String, dynamic> jSon) {
    return DeleteCartItemModel(
        message: jSon["message"], status: jSon['status']);
  }
}
