import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:webview_flutter_sample/const_values/web_urls.dart';
import 'package:webview_flutter_sample/main.dart';
import 'package:webview_flutter_sample/widgets/common.dart';

class FlutterInAppWebView extends StatelessWidget {
  FlutterInAppWebView({Key? key}) : super(key: key);

  // late WebViewController _webViewController;
  late InAppWebViewController _webViewController;

  // final _cookieManager = CookieManager();

  Map<String, String> parseCookies(String cookieString) {
    Map<String, String> cookies = {};

    // cookieがダブルクウォート（"）が付いた状態で取得される為、
    // ダブルクウォート削除
    List<String> cookiePairs = cookieString.replaceAll('"', '').split('; ');
    for (String cookiePair in cookiePairs) {
      List<String> parts = cookiePair.split('=');
      logger.info("parts => $parts");
      if (parts.length == 2) {
        String key = parts[0];
        String value = parts[1];
        cookies[key] = value;
      }
    }

    return cookies;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(title: 'FlutterInAppWebView'),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     // await _cookieManager.clearCookies();
      //
      //     final String cookies = await _webViewController.evaluateJavascript(
      //       source: 'document.cookie',
      //     ) as String;
      //
      //     logger.info("🍫🍪$cookies");
      //
      //     if (cookies.replaceAll('"', '').isNotEmpty) {
      //       final Map<String, dynamic> _parseCookies = parseCookies(cookies);
      //       // cookies表示
      //       _parseCookies.forEach((key, value) {
      //         logger.info("🍪key => $key");
      //         logger.info("🍪value => $value");
      //       });
      //     }
      //   },
      //   child: const Icon(Icons.web_outlined),
      // ),
      body: InAppWebView(
        initialUrlRequest:
            URLRequest(url: Uri.parse(WebUrls.FILE_UPLOADER)),
        onWebViewCreated: (InAppWebViewController webViewController) {
          _webViewController = webViewController;
        },
      ),
    );
  }
}
