import '../../data/model/character_model.dart';

abstract class CharactersStates {}

class CharacterInitialState extends CharactersStates {}

class CharacterSuccessState extends CharactersStates {
  final List<CharacterModel> characterModel;

  CharacterSuccessState(this.characterModel);
}

class CharacterErrorState extends CharactersStates {
  final String error;

  CharacterErrorState(this.error);
}
