import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http_clint;
import 'package:salesindia/domain/constents/app_prefs.dart';
import '../../domain/constents/exception.dart';

class ApiHelper {
  /// Get Method
  Future<dynamic> getApi({
    required String url,
  }) async {
    var uri = Uri.parse(url);
    String? tokan = await AppPrefs().getPrefs();
    try {
      var res = await http_clint
          .get(uri, headers: {'Authorization': 'Bearer $tokan'});
      print("$tokan");
      return returnJsonResponse(res);
    } on SocketException catch (e) {
      FetchDataException(errorMsg: "Internet Not Found $e");
    }
  }

  /// Post Method
  Future<dynamic> postApi({
    required String url,
    Map<String, dynamic>? bodyParams,
    bool isHeadersRequired = false,
  }) async {
    var uri = Uri.parse(url);
    String? token;
    if (isHeadersRequired) {
      token = await AppPrefs().getPrefs();
    }
    try {
      var res = await http_clint.post(uri,
          body: jsonEncode(bodyParams),
          headers: isHeadersRequired ? {'Authorization': 'Bearer $token'} : {});
      return returnJsonResponse(res);
    } on SocketException catch (e) {
      FetchDataException(errorMsg: "Internet Not Found $e");
    }
  }
}

dynamic returnJsonResponse(http_clint.Response res) {
//  print(res.statusCode);
  //print(res.body);
  switch (res.statusCode) {
    case 200:
      {
        var dResp = jsonDecode(res.body);
        return dResp;
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
