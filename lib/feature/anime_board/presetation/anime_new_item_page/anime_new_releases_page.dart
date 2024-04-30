import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/domain/router/router.gr.dart';

@RoutePage()
class AnimeNewReleasesPage extends StatefulWidget {
  const AnimeNewReleasesPage({super.key});

  @override
  State<AnimeNewReleasesPage> createState() => _AnimeNewReleasesPageState();
}

class _AnimeNewReleasesPageState extends State<AnimeNewReleasesPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        color: Colors.green,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AutoRouter.of(context).push(const FavoriteAnimeRoute());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
