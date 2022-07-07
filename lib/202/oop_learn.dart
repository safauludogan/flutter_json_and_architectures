import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'custom_exception.dart';

abstract class IFileDownload {
  bool? downloadItem(FileItem? fileItem);

  Future<void> toShare(String path)async {
    await launchUrl(Uri.parse(path));
  }
}

class FileDownload extends IFileDownload with ShareMixin{
  @override
  bool? downloadItem(FileItem? fileItem) {
    if (fileItem == null) throw FileDownloadException();

    debugPrint('a');

    return true;
  }

  void smsShare(){

  }
}

class SMSDownload implements IFileDownload {
  @override
  bool? downloadItem(FileItem? fileItem) {
    if (fileItem == null) throw FileDownloadException();

    debugPrint('a');

    return true;
  }

  @override
  Future<void> toShare(String path) async {
    await launchUrl(Uri.parse("sms:$path"));
  }

}

class FileItem {
  final String name;
  final File file;

  FileItem(this.name, this.file);
}

class SafaDownload extends IFileDownload with ShareMixin{
  @override
  bool? downloadItem(FileItem? fileItem) {
    // TODO: implement downloadItem
    throw UnimplementedError();
  }
}

mixin ShareMixin on IFileDownload{
  void toShowFile(){}
}

