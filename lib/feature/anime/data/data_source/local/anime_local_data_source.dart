import 'dart:convert';
import 'package:anime_hub/core/domain/model/material_data.dart';
import 'package:anime_hub/core/domain/model/season.dart';
import 'package:anime_hub/core/domain/use_case_result/use_case_result.dart';
import 'package:sqflite/sqflite.dart';

import '../../../../../core/data/database/database_provider.dart';
import '../../../../../core/domain/app_error/app_error.dart';
import '../../../../../core/domain/model/anime_api_item.dart';

class AnimeLocalDataSource {
  final DBProvider _dbProvider;

  AnimeLocalDataSource({required DBProvider dbProvider})
      : _dbProvider = dbProvider;

  Map<String, Season> seasonFromJson({required String seasonsString}) {
    final seasonsMapJson = jsonDecode(seasonsString) as Map<String, dynamic>?;
    final seasonsMap = seasonsMapJson!.map(
      (k, e) => MapEntry(k, Season.fromJson(e as Map<String, dynamic>)),
    );
    return seasonsMap;
  }

  Future<Result<List<AnimeApiItem>>> getAnimeListFromDb() async {
    try {
      final db = await _dbProvider.database;
      final result = await db.rawQuery("SELECT * FROM AnimeApiItem");
      final List<AnimeApiItem> animeItemList = result.isNotEmpty
          ? result
              .map((e) => AnimeApiItem(
                    id: e['id'] as String,
                    type: e['type'] as String,
                    link: e['link'] as String,
                    title: e['title'] as String,
                    titleOrig: e['titleOrig'] as String,
                    year: e['year'] as int,
                    seasons:
                        seasonFromJson(seasonsString: e['seasons'] as String),
                    materialData: MaterialData.fromJson(
                        jsonDecode(e['materialData'] as String)),
                  ))
              .toList()
          : [];
      return Result.good(animeItemList);
    } catch (e) {
      return Result.bad([SpecificError('Empty response data')]);
    }
  }

  Future<Result<bool>> insertAnimeItem(AnimeApiItem animeApiItem) async {
    try {
      final db = await _dbProvider.database;
      final materialDataJsonEncode =
          jsonEncode(animeApiItem.materialData?.toJson());
      final seasonJsonEncode = jsonEncode(animeApiItem.seasons ?? {});
      getAnimeListFromDb();
      await db.insert(
        'AnimeApiItem',
        {
          'id': animeApiItem.id,
          'type': animeApiItem.type,
          'link': animeApiItem.link,
          'title': animeApiItem.title,
          'titleOrig': animeApiItem.titleOrig,
          'year': animeApiItem.year,
          'seasons': seasonJsonEncode,
          'materialData': materialDataJsonEncode,
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      return const Result.good(true);
    } catch (e) {
      return Result.bad([SpecificError('Empty response data')]);
    }
  }

  Future<void> deleteItemFromFavorite(String id) async {
    try {
      final db = await _dbProvider.database;
      await db.delete(
        'AnimeApiItem',
        where: 'id = ?',
        whereArgs: [id],
      );
    } catch (e) {}
  }

  Future<Result<List<AnimeApiItem>>> searchAnimeInFavorites({required String excerptTitle}) async {
    try {
      final db = await _dbProvider.database;
      final List<Map<String, dynamic>> result = await db.rawQuery(
          "SELECT * FROM AnimeApiItem WHERE title LIKE ?;",
          ['%$excerptTitle%']
      );
      final List<AnimeApiItem> animeItemList = result.isNotEmpty
          ? result
          .map((e) => AnimeApiItem(
        id: e['id'] as String,
        type: e['type'] as String,
        link: e['link'] as String,
        title: e['title'] as String,
        titleOrig: e['titleOrig'] as String,
        year: e['year'] as int,
        seasons: seasonFromJson(seasonsString: e['seasons'] as String),
        materialData: MaterialData.fromJson(jsonDecode(e['materialData'] as String)),
      ))
          .toList()
          : [];
      return Result.good(animeItemList);
    } catch (e) {
      return Result.bad([SpecificError('Empty response data')]);
    }
  }

  Future<bool> checkIfAnimeIsFavorite(String id) async {
    try {
      final db = await _dbProvider.database;
      final List<Map<String, dynamic>> result = await db.query(
        'AnimeApiItem',
        where: 'id = ?',
        whereArgs: [id],
      );
      return result.isNotEmpty;
    } catch (e) {
      return false;
    }
  }


}
