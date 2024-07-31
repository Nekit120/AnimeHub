import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pannable_rating_bar/flutter_pannable_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_variables/reactive_variables.dart';

import '../../../../../core/presentation/controllers/app_text_editing_controller.dart';
import '../../../../../core/presentation/view/view_model.dart';
import '../../../domain/entity/locality.dart';
import '../../../domain/stateManager/releases/anime_releases_notifier.dart';
import 'filter_vm.dart';

class FilterItemBottomSheet extends BaseView<FilterViewModel> {
  final AppTextEditingController costController = AppTextEditingController();

  final isSelect = false.rv;

  FilterItemBottomSheet({super.key, required super.vmFactory});

  Widget localityItem(
      {required Locality locality,
      required int index,
      required FilterViewModel vm}) {
    return Row(
      children: [
        vm.controllers[index].observer(
          (context, value) => Checkbox(
            value: vm.controllers[index].value,
            onChanged: (value) {
              vm.controllers[index](value ?? false);
              vm.updateCityList(
                  index, locality.name, vm.controllers[index].value);
            },
          ),
        ),
        const SizedBox(width: 24),
        Text(
          locality.name,
          style: Theme.of(vm.context).textTheme.bodyLarge,
        )
      ],
    );
  }

  final _showCityList = false.rv;

  @override
  Widget build(FilterViewModel vm) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _showCityList.observer((context, value) => value
                  ? _cityListBuilder(
                      vm: vm,
                    )
                  : _filterHeaderBuilder(vm: vm, ref: ref)),
              const SizedBox(height: 16),
            ],
          );
        }),
      ),
    );
  }

  Widget _cityListBuilder({required FilterViewModel vm}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Expanded(
              child: AppBar(
                leading: BackButton(
                  onPressed: () => _showCityList.trigger(false),
                ),
                title: Text("Фильтр"),
                backgroundColor: Colors.transparent,
                actions: [
                  TextButton(
                      onPressed: () {
                        vm.clearCityListNames();
                      },
                      child: const Text('Сбросить')),
                  const SizedBox(width: 16),
                ],
              ),
            )
          ],
        ),
        SizedBox(
          width: 500,
          height: 330,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: AnimeGenresList.values.length,
            itemBuilder: (context, index) => localityItem(
              locality: AnimeGenresList.values[index],
              index: index,
              vm: vm,
            ),
            separatorBuilder: (context, index) => const SizedBox(height: 8),
          ),
        ),
      ],
    );
  }

  Widget _citiItem({required String citiName, required BuildContext context}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      alignment: Alignment.center,
      child: Container(
        height: 50,
        padding: const EdgeInsets.only(left: 12, right: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(11),
          border: Border.all(
            // color: LightThemeColors.outlineColorNV50,
            width: 1,
          ),
        ),
        alignment: Alignment.center,
        child: Row(
          children: [
            Text(
              citiName,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const Icon(
              Icons.close,
              // color: LightThemeColors.onSurfaceVarColorNV30,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }

  Widget _filterHeaderBuilder(
      {required FilterViewModel vm, required WidgetRef ref}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Фильтры",
                style: Theme.of(vm.context).textTheme.titleLarge,
              ),
              TextButton(
                onPressed: () async {
                  vm.context.popRoute();
                    String rangeString = List.generate(
                        (vm.currentRangeValues.value.end -
                                vm.currentRangeValues.value.start + 1)
                            .toInt(),
                        (index) => (vm.currentRangeValues.value.start + index)
                            .toInt()).join(',');

                    await ref
                        .read(animeReleasesApiProvider.notifier)
                        .getDataWithFilterFromApi(
                            getAnimeListFunction:
                                vm.findAnimeByRequestUseCase.call,
                            genres: vm.animeNamesList.value.values.toList(),
                            year: vm.isRangeCheck == false ? null : rangeString,
                            rait: vm.rating.value);
                },
                child: const Text("Применить"),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            "Жанры",
            style: Theme.of(vm.context).textTheme.titleMedium,
          ),
          vm.animeNamesList.observer(
            (context, value) => Column(
              children: [
                if (value.isNotEmpty) const SizedBox(height: 12),
                SizedBox(
                    height: value.isNotEmpty ? 35 : 0,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: List.generate(
                        value.length,
                        (index) => GestureDetector(
                          onTap: () {
                            vm.removeControllerAndItemCityNames(
                                value.keys.toList()[index]);
                          },
                          child: _citiItem(
                              citiName: value.values.toList()[index],
                              context: vm.context),
                        ),
                      ),
                    )),
              ],
            ),
          ),
          TextButton(
            onPressed: () => _showCityList.trigger(true),
            child: Text("Добавить жанр"),
          ),
          SizedBox(
            height: 16,
          ),

          Text(
            "Года выпуска",
            style: Theme.of(vm.context).textTheme.titleMedium,
          ),
          vm.currentRangeValues.observer(
            (context, value) => RangeSlider(
                values: value,
                min: 1960,
                max: 2024,
                divisions: 2024 - 1960,
                labels: RangeLabels(
                  vm.currentRangeValues.value.start.round().toString(),
                  vm.currentRangeValues.value.end.round().toString(),
                ),
                onChanged: (RangeValues values) {
                  vm.currentRangeValues.value = values;
                  vm.isRangeCheck = true;
                }),
          ),
          Text(
            "Рейтинг",
            style: Theme.of(vm.context).textTheme.titleMedium,
          ),

          vm.rating.observer((context, value) => PannableRatingBar(
                rate: value,
                items: List.generate(
                    10,
                    (index) => const RatingWidget(
                          selectedColor: Colors.yellow,
                          unSelectedColor: Colors.grey,
                          child: Icon(
                            Icons.star,
                            size: 32,
                          ),
                        )),
                onChanged: (newValue) {
                  // value = newValue;
                  vm.rating.value = newValue;
                },
              )),

          // const SizedBox(height: 24),
          // Text(
          //   "S.of(vm.context).adPrice",
          //   style: Theme.of(vm.context).textTheme.titleMedium,
          // ),
          // const SizedBox(height: 12),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     _textFieldCost("S.of(vm.context).from", vm.fromCostController),
          //     const SizedBox(height: 12),
          //     _textFieldCost("S.of(vm.context).to", vm.toCostController),
          //   ],
          // ),
        ],
      ),
    );
  }

  Widget _textFieldCost(
      String labelText, AppTextEditingController costController) {
    return SizedBox(
      width: 159,
      child: TextField(
        controller: costController,
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
        ],
        decoration: InputDecoration(
          labelText: labelText,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
        ),
      ),
    );
  }
}
