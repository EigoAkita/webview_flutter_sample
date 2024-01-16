import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_sample/const_values/web_urls.dart';
import 'package:webview_flutter_sample/widgets/common.dart';

class WebViewFlutter extends StatelessWidget {
  WebViewFlutter({Key? key}) : super(key: key);

  late WebViewController _webViewController;

  // final _cookieManager = CookieManager();
  //
  // Map<String, String> parseCookies(String cookieString) {
  //   Map<String, String> cookies = {};
  //
  //   // cookieがダブルクウォート（"）が付いた状態で取得される為、
  //   // ダブルクウォート削除
  //   List<String> cookiePairs = cookieString.replaceAll('"', '').split('; ');
  //   for (String cookiePair in cookiePairs) {
  //     List<String> parts = cookiePair.split('=');
  //     logger.info("parts => $parts");
  //     if (parts.length == 2) {
  //       String key = parts[0];
  //       String value = parts[1];
  //       cookies[key] = value;
  //     }
  //   }
  //
  //   return cookies;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(title: 'WebViewFlutter'),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     final cookies = await _webViewController.runJavascriptReturningResult(
      //       'document.cookie',
      //     );
      //
      //     logger.info("🍫🍪$cookies");
      //
      //     final Map<String, dynamic> _parseCookies = parseCookies(cookies);
      //     // cookies表示
      //     _parseCookies.forEach((key, value) {
      //       logger.info("🍪key => $key");
      //       logger.info("🍪value => $value");
      //     });
      //   },
      //   child: const Icon(Icons.web_outlined),
      // ),
      body: WebView(
        initialUrl: WebUrls.FILE_UPLOADER,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _webViewController = webViewController;
        },
      ),
    );
  }
}
