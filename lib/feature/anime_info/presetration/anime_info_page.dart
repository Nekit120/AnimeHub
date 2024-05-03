import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../anime_board/domain/model/anime_api_item.dart';

@RoutePage()
class AnimeInfoPage extends StatelessWidget {
  final AnimeApiItem _animeApiItem;

  const AnimeInfoPage({super.key, required AnimeApiItem animeItem})
      : _animeApiItem = animeItem;

  AppBar get _profileAppBar => AppBar(
        title: Text("Подробная информация"),
        actions: [
          IconButton(
              icon: const Icon(
                Icons.search,
              ),
              onPressed: () {}),
          IconButton(
              icon: const Icon(
                Icons.settings,
              ),
              onPressed: () {}),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _profileAppBar,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                ClipRRect(
                  child: Image.network(
                    _animeApiItem.materialData?.posterUrl ??
                        "https://shikimori.one/system/animes/original/56838.jpg",
                    height: 180,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  left: 16,
                  bottom: -130,
                  child: Card(
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: SizedBox(
                      child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                              Radius.circular(12)),
                          child: Image.network(
                            _animeApiItem.materialData?.posterUrl ?? "https://shikimori.one/system/animes/original/56838.jpg",
                            height: 160,
                            width: 110,
                            fit: BoxFit.cover,
                          )),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 140,),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(_animeApiItem.materialData?.description?? "Подробная информация пока не добавлена",style: GoogleFonts.manrope(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.4,
              ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
