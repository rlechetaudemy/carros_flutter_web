import 'dart:convert' as convert;

import 'package:carros_flutter_web/imports.dart';
import 'package:http/http.dart' as http;

class PushInput {
  String title;
  String msg;
  String token;
}

class PushApi {
  static Future<ApiResponse> push(PushInput input) async {
    final url = "https://fcm.googleapis.com/fcm/send";

    final params = {
      "notification": {
        "title": input.title,
        "body": input.msg,
        "priority": "high"
      },
      "data": {
        "click_action": "FLUTTER_NOTIFICATION_CLICK",
        "msg": "Firebase muito legal"
      },
      "registration_ids": [input.token]
    };

    final headers = {
      "Content-Type": "application/json",
      "Authorization":
          "Key=AAAAiAAixGc:APA91bFzHC7FPtfea7jBHu2OynyHjh3pVLI_SnCu-yESeqrT5YNtp9Y1HTChpgb9ELI1lT3cG3U50GtoTFC5jkzB-gBoWM_jaQpbolC98936Lkl1GrGtFbjRCeOIt_FctEEBb5d_YdsF"
    };

    print("> Login POST: $url");
    print("> Params: $params");

    String json = convert.json.encode(params);

    final response = await http.post(
      url,
      body: json,
      headers: headers,
    );

    print("> ${response.body}");

    if (response.statusCode == 200) {
      return ApiResponse.ok(msg: "Push enviado com sucesso.");
    }

    return ApiResponse.error(msg: "Erro ao enviar push");
  }
}
