import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  Future<dynamic> get({
    required String url,
    String? token,
  }) async {
    http.Response? data;
    try {
      data = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      );
      if (data.statusCode == 200 && data.body != null) {
        return json.decode(data.body);
      }
    } catch (e) {
      throw Exception(
          'Api Format Error => $e ++ Response Body => ${data?.body ?? 'Null Body'} ++ statusCode => ${data?.statusCode ?? 'Null Body'} ');
    }
  }

  Future<dynamic> post({
    required String url,
    required dynamic body,
    String? token,
  }) async {
    http.Response? data;
    try {
      data = await http.post(Uri.parse(url),
          headers: {
            'Authorization': 'Bearer $token',
            'Accept': 'application/json',
          },
          body: body);
      if (data.statusCode == 200 && data.body != null) {
        return json.decode(data.body);
      }
    } catch (e) {
      throw Exception(
          'Api Format Error => $e ++ Response Body => ${data?.body ?? 'Null Bodey'} ++ statusCode => ${data?.statusCode ?? 'Null Body'} ');
    }
  }

  Future<dynamic> multiPartR({
    required String url,
    required Map body,
    String? token,
  }) async {
    var request = http.MultipartRequest('POST', Uri.parse(url));

    request.headers.addAll({'Authorization': 'Bearer $token'});

    for (int index = 0; index < body.length; index++) {}
  }

  Future<dynamic> delete({
    required String url,
    Map<String, String>? headers,
    required String token,
  }) async {
    http.Response? data;
    try {
      data = await http.delete(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      );
      if (data.statusCode == 200 && data.body != null) {
        return json.decode(data.body);
      } else {
        throw Exception(
            'Response Body => Null Bodey ++ statusCode => ${data.statusCode} ');
      }
    } catch (e) {
      throw Exception(
          'Api Format Error => $e ++ Response Body => ${data?.body ?? 'Null Bodey'} ++ statusCode => ${data?.statusCode ?? 'Null Body'} ');
    }
  }
}
