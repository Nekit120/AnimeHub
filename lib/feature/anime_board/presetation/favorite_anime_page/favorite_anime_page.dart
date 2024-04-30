import 'package:anime_hub/core/domain/router/router.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

@RoutePage()
class FavoriteAnimePage extends StatefulWidget {
  const FavoriteAnimePage({super.key});

  @override
  State<FavoriteAnimePage> createState() => _AnimeNewItemPageState();
}

class _AnimeNewItemPageState extends State<FavoriteAnimePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        color: Colors.red,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
