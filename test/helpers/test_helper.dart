import 'package:anywhere_mobile_test/features/characters/data/data_sources/remote/character_api_service.dart';
import 'package:anywhere_mobile_test/features/characters/domain/usecases/get_characters.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks(
  [
    CharacterAPIService,
    GetCharacterUseCase,
  ],
)
void main() {}
