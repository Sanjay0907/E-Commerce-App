import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:e_commerce_app/e_commerce_app/controller/services/apis_and_headers.dart';
import 'package:http/http.dart' as http;

class API {
  static Future getProducts() async {
    try {
      var response = await http.get(productUrl, headers: {
        'Content-Type': 'application/json'
      }).timeout(const Duration(seconds: 60), onTimeout: () {
        throw TimeoutException('Connection Timed out');
      });
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        var decodedResponse = jsonDecode(response.body);
        log(decodedResponse.toString());
        List<dynamic> products = decodedResponse as List<dynamic>;
        return products;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
