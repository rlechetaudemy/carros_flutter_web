import 'dart:convert' as convert;
import 'package:carros_flutter_web/imports.dart';
import 'package:http/http.dart' as http;

class UploadApi {
  static Future<ApiResponse<String>> upload(
      String fileName, String mimeType, String base64) async {
    try {
      String url = "https://carros-springboot.herokuapp.com/api/v1/upload";

      var params = {
        "fileName": fileName,
        "mimeType": mimeType,
        "base64": base64
      };

      String json = convert.jsonEncode(params);

      print("http.upload: " + url);
      print("fileName: " + fileName);
      print("mimeType: " + mimeType);
      print("base64: " + base64.substring(0, 20));

      final headers = {
        "content-type": "application/json",
      };

      final response = await http
          .post(url, body: json, headers: headers)
          .timeout(Duration(seconds: 120), onTimeout: _onTimeOut);

      print("http.upload << " + response.body);

      Map<String, dynamic> map = convert.json.decode(response.body);

      String urlFoto = map["url"];

      return ApiResponse.ok(result: urlFoto);
    } catch (error, exception) {
      print("Erro ao fazer upload: $error - $exception");

      return ApiResponse.error(msg: "Não foi possível fazer o upload");
    }
  }

  static FutureOr<http.Response> _onTimeOut() {
    throw Exception("Não foi possível se comunicar com o servidor.");
  }
}
