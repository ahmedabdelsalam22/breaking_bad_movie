import 'package:breaking_bad_movie/data/model/character_model.dart';
import 'package:breaking_bad_movie/presentation/screens/characters_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../business_logic/characters/characters_cubit.dart';
import '../data/repository/characters_repository.dart';
import '../data/web_services/characters_web_services.dart';
import '../presentation/screens/characters_details.dart';
import 'constance/text_manager.dart';

class AppRouter {
  CharactersCubit? charactersCubit;
  CharactersRepository? charactersRepository;

  AppRouter() {
    charactersRepository = CharactersRepository(CharactersWebServices());
    charactersCubit = CharactersCubit(charactersRepository!);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case TextManager.charactersScreen:
        return MaterialPageRoute(builder: (_) {
          return BlocProvider(
            create: (context) => charactersCubit!,
            child: const CharactersScreen(),
          );
        });

      case TextManager.charactersDetailsScreen:
        final characterModel = settings.arguments as CharacterModel;
        return MaterialPageRoute(builder: (_) {
          return CharactersDetailsScreen(
            characterModel: characterModel,
          );
        });
    }
    return null;
  }
}
