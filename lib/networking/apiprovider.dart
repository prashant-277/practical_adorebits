import 'dart:convert';
import 'dart:io';

import 'package:practical_test_adorebits/utils/constants.dart';
import 'custom_exception.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  Future<dynamic> get(String url) async {
    var responseJson;
    try {
      var response;
        response = await http.get(Uri.parse(url));
      print("dddd " + url);
      responseJson = _response(response);
    } on SocketException {
      throw NoInternetException(strNoInternetConnection == "null"
          ? "No Internet Connection!"
          : strNoInternetConnection);
    }
    return responseJson;
  }

  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 201:
      case 204:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 400:
        var responseJson = json.decode(response.body.toString());
        var msg = responseJson["message"];
        return responseJson;

        throw BadRequestException(msg);
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 412:
        var responseJson = json.decode(response.body.toString());
        return responseJson;

      case 500:
        var responseJson = json.decode(response.body.toString());
        var error = responseJson["errors"] ?? "";
        var msg = "";
        throw BadRequestException(msg ?? response.body.toString());
      case 422:
        var responseJson = json.decode(response.body.toString());
        var msg = responseJson["message"];
        throw BadRequestException(msg);
      default:
        throw FetchDataException(
            'Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
