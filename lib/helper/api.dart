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
      if (data.statusCode == 200 ||data.statusCode == 201 && data.body != null) {
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
      if (data.statusCode == 200 ||data.statusCode == 201 && data.body != null) {
        return json.decode(data.body);
      }
    } catch (e) {
      throw Exception(
          'Api Format Error => $e ++ Response Body => ${data?.body ?? 'Null Bodey'} ++ statusCode => ${data?.statusCode ?? 'Null Body'} ');
    }
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
  Future<dynamic> multiPartR({
    required String url,
    required Map<String, dynamic> body,
    String? token,
  }) async {
    List valueList = [];
    bool listField = false;

    final regEX =
    RegExp(r"(\/[a-z_\-\s0-9\.]+)+\.(txt|gif|pdf|doc|docx|jpeg|png|jpg)$");
    var request = http.MultipartRequest('POST', Uri.parse(url));

    request.headers.addAll({
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    });

    body.forEach((key, value) async {
      if (value.runtimeType == List<dynamic>) {
        valueList = value;
        listField = true;
      } else if (value.runtimeType == List<String>) {
        valueList = value;
        listField = true;
      } else if (value.runtimeType == List<int>) {
        valueList = value;
        listField = true;
      } else {
        listField = false;
      }

      if (valueList.isNotEmpty && listField) {
        for (int index = 0; index < valueList.length; index++) {
          if (regEX.hasMatch(valueList[index])) {
            request.files.add(await http.MultipartFile.fromPath(
                '$key[${index.toString()}]', valueList[index]));
          } else {
            request.fields
                .addAll({'$key[${index.toString()}]': valueList[index]});
          }
        }
      } else {
        if (!listField) {
          if (regEX.hasMatch(value)) {
            request.files.add(await http.MultipartFile.fromPath(key, value));
          } else {
            if (value.length > 1) {
              request.fields[key] = value;
            }
          }
        }
      }
    });

    var response = await request.send();

    final data = await response.stream.bytesToString();

    print(data);

    if (response.statusCode == 200) {
      return jsonDecode(data);
    } else {
      return {
        'error': 'Api Format Error',
        'body': 'Null Body',
        'statusCode': '${response.statusCode} ',
        'message': 'Try again'
      };
    }
  }
}
