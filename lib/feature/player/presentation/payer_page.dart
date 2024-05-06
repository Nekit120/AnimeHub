import 'dart:convert';
import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

@RoutePage()
class PlayerPage extends StatefulWidget {
  String animeStreamUrl;

  PlayerPage({super.key, required this.animeStreamUrl});

  @override
  State<PlayerPage> createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String fullUrl = "https://${widget.animeStreamUrl}";
    String video =
        "<iframe src=\"$fullUrl\" width=\"100%\" height=\"100%\" frameborder=\"0\" allowfullscreen allow=\"autoplay *; fullscreen *\"></iframe>";

    String encodedHtml = Uri.dataFromString(
      video,
      mimeType: 'text/html',
      encoding: Encoding.getByName('utf-8'),
    ).toString();

    return Scaffold(
      body: WebView(
        backgroundColor: CupertinoColors.black,
        initialUrl: encodedHtml,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
