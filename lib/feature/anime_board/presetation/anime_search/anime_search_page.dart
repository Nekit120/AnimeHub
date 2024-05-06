import 'package:anime_hub/core/presentation/view/view_model.dart';
import 'package:anime_hub/core/presentation/widget/customAppBar.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../generated/l10n.dart';
import 'anime_search_vm.dart';

@RoutePage()
class AnimeSearch extends BaseView<AnimeSearchViewModel> {
  const AnimeSearch({super.key, required super.vmFactory});

  @override
  Widget build(AnimeSearchViewModel vm) {
    final isNotHorizontal = MediaQuery.of(vm.context).orientation != Orientation.landscape;
    return Scaffold(
      appBar: isNotHorizontal? CustomAppBar(
          titleAppBar: S.of(vm.context).title_search, context: vm.context): null,
      body: Padding(
        padding: isNotHorizontal ? const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4): const EdgeInsets.only(left: 16.0, right: 16.0, top: 28) ,
        child: Column(
          children: [
            SizedBox(
              height: 60,
              child: TextField(
                  decoration: InputDecoration(
                labelText: S.of(vm.context).title_search,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              )),
            )
          ],
        ),
      ),
    );
  }
}
