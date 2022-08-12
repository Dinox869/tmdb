import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:tmdb/common/ui.dart';

// Error message display on SnackBar
class NetworkException {
  errorCode(int code, String responseMessage) async{
    String? message = '';
    switch (code) {
      case 400:
        message = 'Invalid request.';
        break;
      case 401:
        message = 'You are unauthorized.';
        break;
      case 403:
        message = 'Access denied.';
        break;
      case 404:
        message = 'Requested link doesn\'t exist.';
        break;
      case 405:
        message = 'Request made using the wrong request method.';
        break;
      case 409:
        message = 'Requested made under false assumption.';
        break;
      case 408:
        message = 'Requested has timed out.';
        break;
      case 422:
        message = 'UnProcessable Entity.';
        break;
      case 500:
        message = 'Internal server error.';
        break;
      case 503:
        message = 'Server is not ready to handle the request.';
        break;
      case 101:
        message = 'Network is unreachable';
        break;
      case 100:
        message = 'Wrong pin.';
        break;
      default:
        message = null;
        print('the code is :: ${code}');
    }
    if (message == null) {
      if (responseMessage.contains('type')) {
        return 'Request can\'t be processed at the moment.';
      } else {
        return responseMessage;
      }
    }
    Get.showSnackbar(UI.errorSnackBar(message: message));
    return message;
  }

  dioError(DioError e) async{
    String message = '';
       
    switch (e.type) {
      case DioErrorType.cancel:
        message = 'Request has been cancelled';
        break;
      case DioErrorType.connectTimeout:
        message = 'Request has timeout.';
        break;
      case DioErrorType.sendTimeout:
        message = 'Request has timeout.';
        break;
      case DioErrorType.receiveTimeout:
        message = 'Requested has timeout.';
        break;
      case DioErrorType.response:
        message = 'Request can\'t be processed at the moment.';
        break;
      case DioErrorType.other:
        if (e.error.toString().contains('101') == true) {
          message = 'Network is unreachable.';
        } else if (e.error.toString().contains('7') == true) {
          message = 'Request failed.';
        } else {
          message = 'Requested has timed out.';
        }
        break;

      default:
        message = 'Request can\'t be processed at the moment.';
    }
    Get.showSnackbar(UI.errorSnackBar(message: message));
    return message;
  }
}
