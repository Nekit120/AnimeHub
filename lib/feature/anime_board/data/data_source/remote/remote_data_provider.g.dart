// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_data_provider.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _RemoteDataProvider implements RemoteDataProvider {
  _RemoteDataProvider(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://kodikapi.com/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<AnimeApiList> getAnimeList({
    String token = "405c66c107c8a27b0064e1506d2ded9f",
    String types = "anime-serial,anime",
    bool withEpisodes = true,
    bool withMaterialData = true,
    int limit = 20,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'token': token,
      r'types': types,
      r'with_episodes': withEpisodes,
      r'with_material_data': withMaterialData,
      r'limit': limit,
    };
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<AnimeApiList>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'list',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = AnimeApiList.fromJson(_result.data!);
    return value;
  }

  @override
  Future<AnimeApiList> findAnimeByRequest({
    String token = "405c66c107c8a27b0064e1506d2ded9f",
    String types = "anime-serial,anime",
    bool withEpisodes = true,
    bool withMaterialData = true,
    String translationType = "subtitles",
    int limit = 30,
    String title = "",
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'token': token,
      r'types': types,
      r'with_episodes': withEpisodes,
      r'with_material_data': withMaterialData,
      r'translation_type': translationType,
      r'limit': limit,
      r'title': title,
    };
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<AnimeApiList>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'search',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = AnimeApiList.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
