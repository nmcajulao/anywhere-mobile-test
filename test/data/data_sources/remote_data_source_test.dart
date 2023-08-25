import 'package:anywhere_mobile_test/core/resources/data_state.dart';
import 'package:anywhere_mobile_test/features/characters/data/models/character.dart';
import 'package:anywhere_mobile_test/features/characters/data/repository/character_repository_impl.dart';
import 'package:anywhere_mobile_test/flavors.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:retrofit/dio.dart';

import '../../helpers/json_reader.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockCharacterAPIService characterAPIService;
  late CharacterRepositoryImpl characterRepositoryImpl;

  setUp(() {
    characterAPIService = MockCharacterAPIService();
    characterRepositoryImpl = CharacterRepositoryImpl(
      characterAPIService: characterAPIService,
    );
  });

  group('get character list', () {
    test(
      'simpsons character api should return a DataSuccess class with the List of CharacterModels and should not be empty and null',
      () async {
        when(
          characterAPIService.getCharacters(
            flavorURL: F.getCharacterUrlFlavorSpecified(Flavor.simpsons),
          ),
        ).thenAnswer(
          (realInvocation) async => HttpResponse(
            await CharacterModel.fromJsonCustom(
              readJson('helpers/dummy_data/dummy_simpson_list_response.json'),
            ),
            Response(
              statusCode: 200,
              requestOptions: RequestOptions(),
            ),
          ),
        );

        final result = await characterRepositoryImpl.getCharacters(
          F.getCharacterUrlFlavorSpecified(Flavor.simpsons),
        );

        expect(result, isA<DataSuccess<List<CharacterModel>>>());
        expect(result.data, isNotNull);
        expect(result.data, isA<List<CharacterModel>>());
        expect(result.data, isNotEmpty);
      },
    );

    test(
      'the wire character api should return a DataSuccess class with the List of CharacterModels and should not be empty and null',
      () async {
        when(
          characterAPIService.getCharacters(
            flavorURL: F.getCharacterUrlFlavorSpecified(Flavor.theWire),
          ),
        ).thenAnswer(
          (realInvocation) async => HttpResponse(
            await CharacterModel.fromJsonCustom(
              readJson('helpers/dummy_data/dummy_the_wire_list_response.json'),
            ),
            Response(
              statusCode: 200,
              requestOptions: RequestOptions(),
            ),
          ),
        );

        final result = await characterRepositoryImpl.getCharacters(
          F.getCharacterUrlFlavorSpecified(Flavor.theWire),
        );

        expect(result, isA<DataSuccess<List<CharacterModel>>>());
        expect(result.data, isNotNull);
        expect(result.data, isA<List<CharacterModel>>());
        expect(result.data, isNotEmpty);
      },
    );

    test(
        'should return a DataFailed state class and with a DioException class info',
        () async {
      when(
        characterAPIService.getCharacters(
          flavorURL: F.getCharacterUrlFlavorSpecified(Flavor.theWire),
        ),
      ).thenAnswer(
        (realInvocation) async => HttpResponse(
          [],
          Response(
            statusCode: 404,
            statusMessage: 'Not Found',
            requestOptions: RequestOptions(),
          ),
        ),
      );

      //act
      final result = await characterRepositoryImpl
          .getCharacters(F.getCharacterUrlFlavorSpecified(Flavor.theWire));

      //assert
      expect(result, isA<DataFailed<List<CharacterModel>>>());
      expect(result.error, isNotNull);
      expect(result.error, isA<DioException>());
    });
  });
}
