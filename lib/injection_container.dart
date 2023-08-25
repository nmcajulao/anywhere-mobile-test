import 'package:anywhere_mobile_test/core/resources/app_package_info.dart';
import 'package:anywhere_mobile_test/features/characters/data/data_sources/remote/character_api_service.dart';
import 'package:anywhere_mobile_test/features/characters/data/repository/character_repository_impl.dart';
import 'package:anywhere_mobile_test/features/characters/domain/repository/character_repository.dart';
import 'package:anywhere_mobile_test/features/characters/domain/usecases/get_characters.dart';
import 'package:anywhere_mobile_test/features/characters/presentation/bloc/character_details/character_details_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'features/characters/presentation/bloc/character_list/character_bloc.dart';

final serviceLocator = GetIt.instance;

Future<void> initializeDependencies() async {
  // * Dio
  serviceLocator.registerSingleton<Dio>(
    Dio(),
  );

  // * Dependencies
  serviceLocator.registerSingleton<CharacterAPIService>(
    CharacterAPIService(
      serviceLocator(),
    ),
  );

  // * Repositories
  serviceLocator.registerSingleton<CharacterRepository>(
    CharacterRepositoryImpl(
      characterAPIService: serviceLocator(),
    ),
  );

  // * Blocs
  serviceLocator.registerFactory<CharacterBloc>(
    () => CharacterBloc(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory<CharacterDetailsBloc>(
    () => CharacterDetailsBloc(),
  );

  // * UseCases
  serviceLocator.registerSingleton<GetCharacterUseCase>(
    GetCharacterUseCase(
      serviceLocator(),
    ),
  );

  // * Resources
  serviceLocator.registerSingleton<AppPackageInfo>(
    AppPackageInfo(),
  );

  await AppPackageInfo.init();
}
