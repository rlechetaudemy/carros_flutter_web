import 'dart:convert' as convert;

import 'package:carros_flutter_web/imports.dart';
import 'package:http/http.dart' as http;

class PushInput {
  // Firebase key
  String key;
  String title;
  String msg;
  String token;

  @override
  String toString() {
    return 'PushInput{key: $key, title: $title, msg: $msg, token: $token}';
  }
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
          "Key=${input.key}"
    };

    print("> Push POST: $url");

    String json = convert.json.encode(params);

    print("> $params");

    final response = await http.post(
      url,
      body: json,
      headers: headers,
    );

    print("< ${response.body}");

    if (response.statusCode == 200) {
      return ApiResponse.ok(msg: "Push enviado com sucesso.");
    }

    return ApiResponse.error(msg: "Erro ao enviar push");
  }
}
