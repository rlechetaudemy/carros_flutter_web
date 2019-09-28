import 'dart:html';

import 'package:carros_flutter_web/colors.dart';
import 'package:carros_flutter_web/pages/upload/upload_api.dart';
import 'package:carros_flutter_web/pages/upload/upload_helper.dart';
import 'package:carros_flutter_web/utils/api_response.dart';
import 'package:carros_flutter_web/web/launch.dart';
import 'package:flutter/material.dart';

class UploadPage extends StatefulWidget {
  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  String url;
  bool showProgress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  _body() {
    return ListView(
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
        Center(
          child: RaisedButton(
            child: Text("Upload"),
            onPressed: _onClickUpload,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Center(
          child: Container(
            color: Colors.grey[100],
            child: ConstrainedBox(
              constraints: BoxConstraints.tightFor(height: 250),
              child: Center(
                child: url == null || showProgress
                    ? showProgress ? CircularProgressIndicator() : FlutterLogo(size: 100,)
                    : InkWell(
                        onTap: () {
                          launch(url);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.network(
                              url,
                            ),
                            Text(
                              url,
                              style: TextStyle(
                                color: AppColors.blue,
                                decorationStyle: TextDecorationStyle.dashed,
                              ),
                            ),
                          ],
                        ),
                      ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  _onClickUpload() {
    UploadHelper.upload(uploadCallback: uploadCallback);
  }

  void uploadCallback(UploadState state) {

    if(state.started) {
      print("Upload iniciado...");
      setState(() {
        showProgress = true;
      });
    } else {
      upload(state.fileUpload);
    }
  }

  upload(FileUpload file) async {
    print("Upload: $file");

    ApiResponse<String> response =
        await UploadApi.upload(file.fileName, file.mimeType, file.base64);

    print("Upload fim");

    if (response.ok) {
      String url = response.result;
      print(url);

      setState(() {
        this.url = url;
        this.showProgress = false;
      });
    }
  }
}
