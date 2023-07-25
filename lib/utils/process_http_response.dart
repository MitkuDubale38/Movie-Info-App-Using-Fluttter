import 'package:http/http.dart' as http;
import 'custom_exceptions.dart';

dynamic processHttpResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      var responseJSON = response;
      return responseJSON;
    case 302:
      throw FileMovedException();
    case 400:
      throw BadRequestException();
    case 401:
      throw UnAuthorizedException();
    case 403:
      throw ForbiddenException();
    case 404:
      throw NotFoundException();
    case 410:
      throw NoLongerAvailableException();
    case 502:
      throw BadGatewayException();
    case 505:
      throw InternalServerError();
    case 408:
      throw ConnectionTimedOutException();
    default:
      throw BadRequestException();
  }
}
