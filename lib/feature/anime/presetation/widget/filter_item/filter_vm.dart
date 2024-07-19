import 'package:anime_hub/feature/anime/domain/useCase/find_anime_by_request_use_case.dart';
import 'package:anime_hub/feature/anime/domain/useCase/get_anime_list_by_filters_use_case.dart';
import 'package:reactive_variables/reactive_variables.dart';

import '../../../../../core/presentation/controllers/app_text_editing_controller.dart';
import '../../../../../core/presentation/view/view_model.dart';
import '../../../domain/entity/locality.dart';
import '../../../domain/repository/anime_repository.dart';

class FilterViewModel extends ViewModel {
  final GetAnimeListByFiltersUseCase findAnimeByRequestUseCase;

  FilterViewModel(super.context,
      {required AnimeRepository animeBoardRepository})
      : findAnimeByRequestUseCase = GetAnimeListByFiltersUseCase(
            animeBoardRepository: animeBoardRepository);

  final AppTextEditingController fromCostController =
      AppTextEditingController();
  final AppTextEditingController toCostController = AppTextEditingController();
  final controllers =
      List.generate(LocalityList.values.length, (index) => false.rv);

  final cityNamesList = <int, String>{}.rv;

  void updateCityList(int cityId, String cityName, bool isSelected) {
    if (isSelected) {
      cityNamesList[cityId] = cityName;
    } else {
      cityNamesList.remove(cityId);
    }
  }

  void removeControllerAndItemCityNames(int cityId) {
    cityNamesList.remove(cityId);
    controllers[cityId].value = false;
  }

  void clearCityListNames() {
    cityNamesList.clear();
    for (var controller in controllers) {
      controller(false);
    }
  }
}
