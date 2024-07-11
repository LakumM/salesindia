class AppException implements Exception {
  String title;
  String eMsg;

  AppException({required this.title, required this.eMsg});

  String toErrorMsg() {
    return "$title : $eMsg";
  }
}

class FetchDataException extends AppException {
  FetchDataException({required String errorMsg})
      : super(title: "Network Error", eMsg: errorMsg);
}

class BadRequestException extends AppException {
  BadRequestException({required String errorMsg})
      : super(title: "Invalid Request", eMsg: errorMsg);
}

class UnauthorisedException extends AppException {
  UnauthorisedException({required String errorMsg})
      : super(title: "Unauthorised", eMsg: errorMsg);
}

class InvalidInputException extends AppException {
  InvalidInputException({required String errorMsg})
      : super(title: "InvalidInput", eMsg: errorMsg);
}
