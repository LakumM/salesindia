class Categories {
  bool? status;
  String? message;
  List<Data>? data;

  Categories({this.status, this.message, this.data});

  factory Categories.fromJson(Map<String, dynamic> json) {
    var status = json['status'];
    var message = json['message'];
    List<Data> data = [];
    if (json['data'] != null) {
      json['data'].forEach((Map<String, dynamic> v) {
        data.add(Data.fromJson(v));
      });
    }

    return Categories(status: status, message: message, data: data);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? name;
  String? status;
  String? createdAt;
  String? updatedAt;

  Data({this.id, this.name, this.status, this.createdAt, this.updatedAt});

  factory Data.fromJson(Map<String, dynamic> json) {
    var id = json['id'];
    var name = json['name'];
    var status = json['status'];
    var createdAt = json['created_at'];
    var updatedAt = json['updated_at'];

    return Data(
        name: name,
        id: id,
        status: status,
        createdAt: createdAt,
        updatedAt: updatedAt);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
