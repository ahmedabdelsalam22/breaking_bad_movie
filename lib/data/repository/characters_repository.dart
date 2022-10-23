import '../model/character_model.dart';
import '../web_services/characters_web_services.dart';

class CharactersRepository {
  final CharactersWebServices? charactersWebServices;

  CharactersRepository(this.charactersWebServices);

  Future<List<CharacterModel>> getAllCharacters() async {
    final characters = await charactersWebServices!.getAllCharacters();
    return characters.map((e) => CharacterModel.fromJson(e)).toList();
  }
}
