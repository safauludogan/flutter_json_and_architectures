import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

mixin LaunchMixin {
  void launchUrl(Uri url) async {
    if (await canLaunchUrl(url)) {

      try{
        launchUrl(url);
      }catch(error){
        ShowDebug.showDioError(error.toString(), this);
      }

    }
  }
}

class ShowDebug {
  static void showDioError<T>(String error, T type) {
    if (kDebugMode) {
      debugPrint(error.toString());
      debugPrint(type.toString());
      debugPrint("------");
    }
  }
}
