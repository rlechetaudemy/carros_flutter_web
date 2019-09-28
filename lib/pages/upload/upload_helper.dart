import 'dart:html';

import 'package:flutter/material.dart';

typedef UploadCallback = void Function(UploadState state);

class UploadState {
  bool started;
  FileUpload fileUpload;

  UploadState({this.started = false, this.fileUpload});

  @override
  String toString() {
    return 'UploadState{started: $started, fileUpload: $fileUpload}';
  }
}

class FileUpload {
  String fileName;
  String mimeType;
  String base64;

  FileUpload(this.fileName, this.mimeType, this.base64);

  @override
  String toString() {
    return 'FileUpload{fileName: $fileName, mimeType: $mimeType';
  }
}

class UploadHelper {
  static upload ({@required UploadCallback uploadCallback}) async {

    InputElement uploadInput = FileUploadInputElement();
    uploadInput.click();

    uploadInput.onChange.listen((e) {
      List<File> files = uploadInput.files;
      if (files.length > 0) {
        // Recupera o arquivo
        final file = files[0];
        print("Upload file: ${file.name}");

        // callback
        uploadCallback(UploadState(started: true));

        // Faz a leitura do arquivo
        final reader = new FileReader();
        reader.onLoadEnd.listen((e) {
          Object result = reader.result;

          //data:text/plain;base64,UmljYXJkbw==
          String s = result;
          print("> $s");

          String base64 = s.substring(s.indexOf(",")+1);

          String mimeType = s.substring(s.indexOf(":")+1,s.indexOf(";"));
          print("mimeType: ${mimeType}");

          final fileUpload = FileUpload(file.name, mimeType, base64);

          // callback
          uploadCallback(UploadState(fileUpload: fileUpload));
        });

        // Lê o arquivo - assíncrono
        reader.readAsDataUrl(file);
      }
    });
  }
}