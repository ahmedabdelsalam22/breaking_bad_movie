import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/character_model.dart';
import '../../data/repository/characters_repository.dart';
import 'characters_states.dart';

class CharactersCubit extends Cubit<CharactersStates> {
  CharactersCubit(this.charactersRepository) : super(CharacterInitialState());

  final CharactersRepository charactersRepository;
  List<CharacterModel>? characterModel;

  List<CharacterModel>? getAllCharacters() {
    charactersRepository.getAllCharacters().then((value) {
      emit(CharacterSuccessState(value));
      characterModel = value;
    }).catchError((onError) {
      emit(CharacterErrorState(onError));
    });
    return characterModel;
  }
}
