import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:simple_logger/simple_logger.dart';
import 'package:webview_flutter_sample/flutter_inappwebview.dart';
import 'package:webview_flutter_sample/webview_flutter.dart';
import 'package:webview_flutter_sample/widgets/common.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

final logger = SimpleLogger();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(title: 'Home'),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlackOutLineButton(
                  text: 'FlutterInAppWebView',
                  onPressed: () => Get.to(() => FlutterInAppWebView())),
              Container(height: 15),
              BlackOutLineButton(
                  text: 'WebViewFlutter',
                  onPressed: () => Get.to(() => WebViewFlutter())),
            ],
          ),
        ),
      ),
    );
  }
}
