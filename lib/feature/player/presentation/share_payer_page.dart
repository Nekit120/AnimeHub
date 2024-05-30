import 'dart:convert';
import 'package:anime_hub/core/domain/container/app_container.dart';
import 'package:anime_hub/core/domain/router/router.gr.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../core/data/firebase_services/model/user_model_with_last_message.dart';

@RoutePage()
class SharePlayerPage extends StatefulWidget {
  final String animeStreamUrl;
  final String receiverUsername;
  final UserModelWithLastMessage userModel;
  final String receiverId;

  const SharePlayerPage({
    super.key,
    required this.animeStreamUrl,
    required this.receiverUsername,
    required this.receiverId,
    required this.userModel,
  });

  @override
  State<SharePlayerPage> createState() => _SinglePlayerPageState();
}

class _SinglePlayerPageState extends State<SharePlayerPage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    super.dispose();
  }

  Future<bool> _onWillPop() async {
    AutoRouter.of(context).replace(PersonalChatRoute(
        receiverUsername: widget.receiverUsername,
        receiverId: widget.receiverId,
        userModel: widget.userModel,
        chatAndAuthRepository:
            AppContainer().repositoryScope.chatAndAuthRepository));
    return false;
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

    return WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
          body: GestureDetector(
            child: WebView(
              backgroundColor: CupertinoColors.black,
              initialUrl: encodedHtml,
              javascriptMode: JavascriptMode.unrestricted,
            ),
          ),
        ));
  }
}
