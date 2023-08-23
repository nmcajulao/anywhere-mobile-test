import 'package:anywhere_mobile_test/core/resources/data_state.dart';
import 'package:anywhere_mobile_test/core/usecase/usecase.dart';
import 'package:anywhere_mobile_test/features/characters/domain/repository/character_repository.dart';

import '../entities/character.dart';

class GetCharacterUseCase
    implements UseCase<DataState<List<CharacterEntity>>, void> {
  final CharacterRepository _characterRepository;

  GetCharacterUseCase(this._characterRepository);

  @override
  Future<DataState<List<CharacterEntity>>> call({void params}) {
    return _characterRepository.getCharacters();
  }
}
