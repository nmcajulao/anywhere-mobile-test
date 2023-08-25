import 'package:anywhere_mobile_test/core/resources/data_state.dart';

import '../entities/character.dart';

abstract class CharacterRepository {
  Future<DataState<List<CharacterEntity>>> getCharacters(String characterURL);
}
