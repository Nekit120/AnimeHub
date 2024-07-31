import 'package:anime_hub/core/domain/model/anime_api_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../core/data/firebase_services/model/user_model_with_last_message.dart';
import '../../../../../core/domain/router/router.gr.dart';
import '../../../../chat/domain/repository/chat_and_auth_repository.dart';

class SendAnimeListBuilderWidget extends StatelessWidget {
  final bool isNotHorizontal;
  final List<AnimeApiItem> animeList;
  final BuildContext context;
  final bool isFavorite;
  final ChatAndAuthRepository chatAndAuthRepository;
  final String proposedId;
  final String acceptId;
  final String receiverUsername;
  final UserModelWithLastMessage userModel;
  final String receiverId;

  const SendAnimeListBuilderWidget({
    super.key,
    required this.isNotHorizontal,
    required this.animeList,
    required this.context,
    required this.isFavorite,
    required this.chatAndAuthRepository,
    required this.proposedId,
    required this.acceptId,
    required this.receiverId,
    required this.userModel,
    required this.receiverUsername,
  });
  void customSnackBarShow() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Center(child: Text("Запрос на просмотр был отправлен.")),
        duration: const Duration(milliseconds: 800),
        backgroundColor: Colors.green[500],
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: isNotHorizontal
          ? const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 0.1,
              mainAxisSpacing: 0.1,
              childAspectRatio: 0.68,
            )
          : const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 0.1,
              mainAxisSpacing: 0.1,
              childAspectRatio: 0.67,
            ),
      itemCount: animeList.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          child: Column(
            children: [
              Card(
                elevation: 1,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: SizedBox(
                  child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      child: isFavorite == true
                          ? CachedNetworkImage(
                              imageUrl: animeList[index]
                                      .materialData
                                      ?.posterUrl ??
                                  "https://shikimori.one/system/animes/original/56838.jpg",
                              height: 255,
                              width: 190,
                              fit: BoxFit.cover,
                              placeholder: (context, url) => const Center(
                                  child: SizedBox(
                                      height: 24,
                                      width: 24,
                                      child: CircularProgressIndicator())),
                            )
                          : Image.network(
                              animeList[index].materialData?.posterUrl ??
                                  "https://shikimori.one/system/animes/original/56838.jpg",
                              height: 255,
                              width: 190,
                              fit: BoxFit.cover,
                            )),
                ),
              ),
              Text(animeList[index].title,
                  maxLines: 1, textAlign: TextAlign.center)
            ],
          ),
          onTap: () {
            chatAndAuthRepository.sendInvite(
                animeLink: animeList[index].link,
                animeName: animeList[index].title,
                animePoster: animeList[index].materialData!.posterUrl!,
                proposedId: proposedId,
                acceptId: acceptId);
                customSnackBarShow();
                Navigator.of(context).pop();
                // AutoRouter.of(context).replace(PersonalChatRoute(
                // receiverUsername: receiverUsername,
                // chatAndAuthRepository: chatAndAuthRepository,
                // receiverId: receiverId,
                // userModel: userModel));
          },
        );
      },
    );
  }
}
