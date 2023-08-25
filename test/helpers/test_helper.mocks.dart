// Mocks generated by Mockito 5.4.2 from annotations
// in anywhere_mobile_test/test/helpers/test_helper.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:anywhere_mobile_test/core/resources/data_state.dart' as _i3;
import 'package:anywhere_mobile_test/features/characters/data/data_sources/remote/character_api_service.dart'
    as _i4;
import 'package:anywhere_mobile_test/features/characters/data/models/character.dart'
    as _i6;
import 'package:anywhere_mobile_test/features/characters/domain/entities/character.dart'
    as _i8;
import 'package:anywhere_mobile_test/features/characters/domain/usecases/get_characters.dart'
    as _i7;
import 'package:mockito/mockito.dart' as _i1;
import 'package:retrofit/retrofit.dart' as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeHttpResponse_0<T> extends _i1.SmartFake
    implements _i2.HttpResponse<T> {
  _FakeHttpResponse_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeDataState_1<T> extends _i1.SmartFake implements _i3.DataState<T> {
  _FakeDataState_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [CharacterAPIService].
///
/// See the documentation for Mockito's code generation for more information.
class MockCharacterAPIService extends _i1.Mock
    implements _i4.CharacterAPIService {
  MockCharacterAPIService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i2.HttpResponse<List<_i6.CharacterModel>>> getCharacters(
          {required String? flavorURL}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getCharacters,
          [],
          {#flavorURL: flavorURL},
        ),
        returnValue:
            _i5.Future<_i2.HttpResponse<List<_i6.CharacterModel>>>.value(
                _FakeHttpResponse_0<List<_i6.CharacterModel>>(
          this,
          Invocation.method(
            #getCharacters,
            [],
            {#flavorURL: flavorURL},
          ),
        )),
      ) as _i5.Future<_i2.HttpResponse<List<_i6.CharacterModel>>>);
}

/// A class which mocks [GetCharacterUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetCharacterUseCase extends _i1.Mock
    implements _i7.GetCharacterUseCase {
  MockGetCharacterUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i3.DataState<List<_i8.CharacterEntity>>> call({dynamic params}) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
          {#params: params},
        ),
        returnValue: _i5.Future<_i3.DataState<List<_i8.CharacterEntity>>>.value(
            _FakeDataState_1<List<_i8.CharacterEntity>>(
          this,
          Invocation.method(
            #call,
            [],
            {#params: params},
          ),
        )),
      ) as _i5.Future<_i3.DataState<List<_i8.CharacterEntity>>>);
}
