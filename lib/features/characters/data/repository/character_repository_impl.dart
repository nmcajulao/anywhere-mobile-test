import 'dart:io';

import 'package:anywhere_mobile_test/core/resources/data_state.dart';
import 'package:anywhere_mobile_test/features/characters/data/data_sources/remote/character_api_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../../flavors.dart';
import '../../domain/repository/character_repository.dart';
import '../models/character.dart';
import 'package:http/http.dart' as http;

class CharacterRepositoryImpl implements CharacterRepository {
  final CharacterAPIService characterAPIService;

  CharacterRepositoryImpl({
    required this.characterAPIService,
  });

  @override
  Future<DataState<List<CharacterModel>>> getCharacters(
      String characterURL) async {
    try {
      final httpResponse =
          await characterAPIService.getCharacters(flavorURL: characterURL);

      /* return DataFailed(
        DioException(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          type: DioExceptionType.unknown,
          requestOptions: httpResponse.response.requestOptions,
        ),
      ); */

      if (httpResponse.response.statusCode == HttpStatus.ok &&
          httpResponse.response.statusCode == 200) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(
          DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.unknown,
            requestOptions: httpResponse.response.requestOptions,
          ),
        );
      }
    } on DioException catch (e) {
      debugPrint("DioException: $e");
      return DataFailed(e);
    }
  }
}
