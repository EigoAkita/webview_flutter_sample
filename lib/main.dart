import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:simple_logger/simple_logger.dart';

void main() {
  runApp(const MyApp());
}

final logger = SimpleLogger();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late WebViewController _webViewController;
  final _cookieManager = CookieManager();

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
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // await _cookieManager.clearCookies();
          final cookies = await _webViewController.runJavascriptReturningResult(
            'document.cookie',
          );

          logger.info("🍫🍪$cookies");

          if (cookies.replaceAll('"', '').isNotEmpty) {
            final Map<String, dynamic> _parseCookies = parseCookies(cookies);
            // cookies表示
            _parseCookies.forEach((key, value) {
              logger.info("🍪key => $key");
              logger.info("🍪value => $value");
            });
          }
        },
        child: const Icon(Icons.web_outlined),
      ),
      body: WebView(
        initialUrl: 'https://deku.posstree.com/en/',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _webViewController = webViewController;
        },
      ),
    );
  }
}
