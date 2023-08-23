// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _CharacterAPIService implements CharacterAPIService {
  _CharacterAPIService(this._dio);

  final Dio _dio;

  String? baseUrl;

  @override
  Future<HttpResponse<List<CharacterModel>>> getCharacters(
      {required flavorURL}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<String>(
        _setStreamType<HttpResponse<List<CharacterModel>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              flavorURL,
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));

    // List<CharacterModel> value = decoded!["Related_Topics"]
    //     .map((dynamic i) => CharacterModel.fromJson(i))
    //     .toList();

    List<CharacterModel> value =
        await CharacterModel.fromJsonCustom(_result.data!);

    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
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
}
