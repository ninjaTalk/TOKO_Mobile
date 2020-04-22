import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
class DeepLink{
  static Future<String> createDynamicLink(String theLink, bool short) async{
    DynamicLinkParameters parameter;
    String link = 'https://www.youtube.com/watch?' + theLink;
    parameter = DynamicLinkParameters(
        uriPrefix: "https://www.youtube.com",
        link: Uri.parse(link),
      androidParameters: AndroidParameters(
          packageName: "com.cubecode.toko_apk",
          minimumVersion: 0,
      ),
      dynamicLinkParametersOptions: DynamicLinkParametersOptions(
        shortDynamicLinkPathLength: ShortDynamicLinkPathLength.short,
      ),
    );

    Uri url;
    if(short){
      final ShortDynamicLink shortDynamicLink = await parameter.buildShortLink();
      url = shortDynamicLink.shortUrl;
    }else{
      url = await parameter.buildUrl();
    }
    return url.toString();
  }
}

//https://www.youtube.com/watch?v=bMzMOyk_1xY