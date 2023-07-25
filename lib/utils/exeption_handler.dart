import 'package:http/http.dart';
import 'dart:io';
import 'package:moviedbapp/utils/custom_exceptions.dart';

class ExceptionHandler {
  String getExceptionString(error) {
    if (error is SocketException) {
      return 'No Internet Connection';
    } else if (error is HttpException) {
      return 'Http Error Occurred';
    } else if (error is FormatException) {
      return 'Invalid Format';
    } else if (error is FileMovedException) {
      return error.message.toString();
    } else if (error is BadRequestException) {
      return error.message.toString();
    } else if (error is UnAuthorizedException) {
      return error.message.toString();
    } else if (error is ForbiddenException) {
      return error.message.toString();
    } else if (error is NotFoundException) {
      return error.message.toString();
    } else if (error is NoLongerAvailableException) {
      return error.message.toString();
    } else if (error is BadGatewayException) {
      return error.message.toString();
    } else if (error is InternalServerError) {
      return error.message.toString();
    } else if (error is ConnectionTimedOutException) {
      return error.message.toString();
    } else if (error is FetchDataException) {
      return error.message.toString();
    } else if (error is ClientException) {
      return error.message.toString();
    } else {
      return 'Unknown Error';
    }
  }
}
