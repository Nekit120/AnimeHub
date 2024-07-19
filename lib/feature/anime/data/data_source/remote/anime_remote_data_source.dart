  import 'package:anime_hub/feature/anime/data/data_source/model/get_anime_list_by_filters_query.dart';
import 'package:dio/dio.dart';
  import 'package:retrofit/http.dart';
  import '../../../../../core/domain/model/anime_api_list.dart';
import '../model/find_anime_by_request_query.dart';
import '../model/get_anime_list_query.dart';

  part 'anime_remote_data_source.g.dart';

  @RestApi(baseUrl: "https://kodikapi.com/")
  abstract class AnimeRemoteDataSource {

    factory AnimeRemoteDataSource(Dio dio) = _AnimeRemoteDataSource;
    @GET("list")
    Future<AnimeApiList> getAnimeList({
      @Queries()  GetAnimeListQuery query = const GetAnimeListQuery(),
    });

    @GET("list")
    Future<AnimeApiList> getAnimeListByFilters({
      @Queries() GetAnimeListByFiltersQuery query = const GetAnimeListByFiltersQuery(genres: ''),
    });

    @GET("search")
    Future<AnimeApiList> findAnimeByRequest({
      @Queries() required FindAnimeByRequestQuery query,
    } );

  }

// class RemoteDataProvider {
//   final String token = "405c66c107c8a27b0064e1506d2ded9f";
//   Future<Result<AnimeApiList>> getAnimeList() async {
//       try{
//         final response = await Dio().get("https://kodikapi.com/list?token=$token&types=anime-serial,anime&with_episodes=true&with_material_data=true&limit=30");
//
//         if (response.data == null) {
//           return Result.bad([SpecificError('Empty response data')]);
//         }
//
//         return Result.good(AnimeApiList.fromJson(response.data));
//
//       }catch (e) {
//         return Result.bad([SpecificError('Server access error')]);
//       }
//   }
//
//   Future<Result<AnimeApiList>> findAnimeByRequest(String title) async {
//     try{
//       final response = await Dio().get("https://kodikapi.com/search?token=$token&types=anime-serial,anime&with_episodes=true&with_material_data=true&translation_type=subtitles&limit=30&title=$title");
//
//       if (response.data == null) {
//         return Result.bad([SpecificError('Empty response data')]);
//       }
//
//       return Result.good(AnimeApiList.fromJson(response.data));
//
//     }catch (e) {
//       return Result.bad([SpecificError('Server access error')]);
//     }
//   }
//
// }