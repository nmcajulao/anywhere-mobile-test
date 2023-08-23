import 'dart:convert';

import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

import '../../models/character.dart';

part 'character_api_service.g.dart';

@RestApi()
abstract class CharacterAPIService {
  factory CharacterAPIService(Dio dio) = _CharacterAPIService;

  @GET("{flavorURL}")
  @Headers(<String, dynamic>{
    "Content-Type": "application/json",
  })
  Future<HttpResponse<List<CharacterModel>>> getCharacters({
    @Path() required String flavorURL,
  });
}
