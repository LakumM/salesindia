import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http_clint;

import '../../domain/constents/exception.dart';

class ApiHelper {
  Future<dynamic> postApi({
    required String url,
    Map<String, dynamic>? mData,
  }) async {
    var uri = Uri.parse(url);
    try {
      var res = await http_clint.post(uri, body: mData, headers: {
        'Authorization':
            'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE3MjA0NDIzNjYsIm5iZiI6MTcyMDQ0MjM2NiwiZXhwIjoxNzIwNDg1NTY2LCJkYXRhIjp7InVzZXJfaWQiOiI3IiwidXNlcl9lbWFpbCI6Im11a2VzaDFAZ21haWwuY29tIn19.8qw5ox4kgU70oIKqTEeYMgco4A-6OsIPPNNsSasITL0'
      });
      return returnJsonResponse(res);
    } on SocketException catch (e) {
      FetchDataException(errorMsg: "Internet Not Found $e");
    }
  }
}

dynamic returnJsonResponse(http_clint.Response res) {
  print(res.statusCode);
  print(res.body);
  switch (res.statusCode) {
    case 200:
      {
        var mData = jsonDecode(res.body);

        print("$mData");
        return JsonResponse(
            status: mData['status'],
            message: mData['message'],
            token: mData['token']);
      }
    case 400:
      throw BadRequestException(errorMsg: res.body.toString());
    case 401:
    case 403:
      throw UnauthorisedException(errorMsg: res.body.toString());
    case 500:
    default:
      throw FetchDataException(
          errorMsg: "error occurred while Communication  with server");
  }
}

class JsonResponse {
  bool? status;
  String? message;
  String? token;
  JsonResponse(
      {required this.status, required this.message, required this.token});
}
