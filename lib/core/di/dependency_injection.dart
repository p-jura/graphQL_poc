import 'package:flutter_graphql_poc/core/core.dart';
import 'package:flutter_graphql_poc/features/characters/data/remote_data_source.dart';
import 'package:flutter_graphql_poc/features/characters/domain/get_characters_use_case.dart';
import 'package:flutter_graphql_poc/features/characters/domain/graphql_repository.dart';
import 'package:flutter_graphql_poc/features/characters/presentation/bloc/characters_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

GetIt getIt = GetIt.instance;

abstract class DependencyInjection {
  static Future<void> initialize() async {
    getIt.registerLazySingleton<GraphQLClient>(() => GraphqlService.client);

    getIt.registerFactory<RemoteDataSource>(
      () => GraphQLRemoteDataSource(client: getIt<GraphQLClient>()),
    );

    getIt.registerFactory<GraphqlRepository>(
      () => GraphqlRepositoryImpl(getIt<RemoteDataSource>()),
    );

    getIt.registerCachedFactory<UseCase>(
      () => GetCharactersUseCase(repository: getIt<GraphqlRepository>()),
    );
    getIt.registerCachedFactory(
      () => CharactersCubit(getCharacterUseCase: getIt<UseCase>()),
    );
  }
}
