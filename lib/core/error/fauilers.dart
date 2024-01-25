import 'package:dio/dio.dart';

abstract class Failures {
  String errorMessage;

  Failures(this.errorMessage);

  @override
  String toString() {
    return errorMessage;
  }
}

class ServerFailure extends Failures {
  ServerFailure(String errorMessage) : super(errorMessage);

  // factory ServerFailure.fromDioError(DioError dioError) {
  //   switch (dioError.type) {
  //     case DioErrorType.connectTimeout:
  //       return ServerFailure("Connection time out with Api server");
  //     case DioErrorType.sendTimeout:
  //       return ServerFailure("Send time out with Api server");
  //     case DioErrorType.receiveTimeout:
  //       return ServerFailure("Receive time out with Api server");
  //     case DioErrorType.response:
  //       return ServerFailure.fromResponse(
  //           dioError.response!.statusCode, dioError.response!.data);
  //     case DioErrorType.cancel:
  //       return ServerFailure("Request to API was cancelled");
  //     case DioErrorType.other:
  //       if (dioError.message.contains("SocketException")) {
  //         return ServerFailure("No internet Connection");
  //       }
  //       return ServerFailure("Unexpected Error, Please try later");
  //     default:
  //       return ServerFailure("Oops there was an error, please try again");
  //   }
  // }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response["error"]["message"]);
    } else if (statusCode == 404) {
      return ServerFailure("Your request not found, please try again");
    } else if (statusCode == 500) {
      return ServerFailure("Internal server error, please try again");
    } else {
      return ServerFailure("Oops there was an error, please try again");
    }
  }
}

class CashedFailures extends Failures {
  CashedFailures(String errorMessage) : super(errorMessage);
}
