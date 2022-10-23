class CharacterModel {
  int? charId;
  String? name;
  String? birthday;
  List<dynamic>? occupation;
  String? image;
  String? status;
  String? nickname;
  List<dynamic>? appearance;
  String? actorName;
  String? categoryForTwoSeries;
  List<dynamic>? petterCallSaulAppearance;

  CharacterModel.fromJson(Map<String, dynamic> json) {
    charId = json['char_id'];
    name = json['name'];
    birthday = json['birthday'];
    occupation = json['occupation'].cast<String>();
    image = json['img'];
    status = json['status'];
    nickname = json['nickname'];
    appearance = json['appearance'].cast<int>();
    actorName = json['portrayed'];
    categoryForTwoSeries = json['category'];
    petterCallSaulAppearance = json['better_call_saul_appearance'];
  }
}
