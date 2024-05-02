import 'package:anime_hub/core/presentation/view/view_model.dart';
import 'package:anime_hub/feature/anime_board/domain/model/anime_api_list.dart';
import 'package:flutter/cupertino.dart';
import '../../data/repository/anime_board_repository_impl.dart';



class AnimeReleasesViewModel extends ViewModel  {
  final ScrollController controller;
  late final AnimeApiList animeApiList;
  final AnimeBoardRepositoryImpl animeBoardRepositoryImpl = AnimeBoardRepositoryImpl();
  AnimeReleasesViewModel(super.context,{ required this.controller});

  Future<void> init() async {
  //  final notifier = super.context.read(animeApiListProvider.notifier);
 //   await notifier.fetchData();
  }


  @override
  void initState() {
    super.initState();
    init();
  }

}