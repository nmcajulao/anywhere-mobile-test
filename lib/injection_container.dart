import 'package:anywhere_mobile_test/features/characters/data/data_sources/remote/character_api_service.dart';
import 'package:anywhere_mobile_test/features/characters/data/repository/character_repository_impl.dart';
import 'package:anywhere_mobile_test/features/characters/domain/repository/character_repository.dart';
import 'package:anywhere_mobile_test/features/characters/domain/usecases/get_characters.dart';
import 'package:anywhere_mobile_test/features/characters/presentation/bloc/character_details/character_details_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'features/characters/presentation/bloc/character_list/character_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // * Dio
  sl.registerSingleton<Dio>(
    Dio(),
  );

  // * Dependencies
  sl.registerSingleton<CharacterAPIService>(
    CharacterAPIService(
      sl(),
    ),
  );

  // * Repositories
  sl.registerSingleton<CharacterRepository>(
    CharacterRepositoryImpl(
      sl(),
    ),
  );

  // * Blocs
  sl.registerFactory<CharacterBloc>(
    () => CharacterBloc(
      sl(),
    ),
  );

  sl.registerFactory<CharacterDetailsBloc>(
    () => CharacterDetailsBloc(),
  );

  // * UseCases
  sl.registerSingleton<GetCharacterUseCase>(
    GetCharacterUseCase(
      sl(),
    ),
  );
}
