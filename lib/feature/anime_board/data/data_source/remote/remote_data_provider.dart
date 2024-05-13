import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import '../../../../../core/domain/model/anime_api_list.dart';
part 'remote_data_provider.g.dart';

@RestApi(baseUrl: "https://kodikapi.com/")
abstract class RemoteDataProvider {

  factory RemoteDataProvider(Dio dio) = _RemoteDataProvider;

  @GET("list")
  Future<AnimeApiList> getAnimeList({
    @Query("token") String token = "405c66c107c8a27b0064e1506d2ded9f",
    @Query("types") String types = "anime-serial,anime",
    @Query("with_episodes") bool withEpisodes = true,
    @Query("with_material_data") bool withMaterialData = true,
    @Query("limit") int limit = 20,
  }) ;

  @GET("search")
  Future<AnimeApiList> findAnimeByRequest({
    @Query("token") String token = "405c66c107c8a27b0064e1506d2ded9f",
    @Query("types") String types = "anime-serial,anime",
    @Query("with_episodes") bool withEpisodes = true,
    @Query("with_material_data") bool withMaterialData = true,
    @Query("translation_type") String translationType = "subtitles",
    @Query("limit") int limit = 30,
    @Query("title") String title = "",
  });

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