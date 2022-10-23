import 'package:breaking_bad_movie/data/model/character_model.dart';
import 'package:flutter/material.dart';

import '../../core/constance/color_manager.dart';
import '../../core/constance/text_manager.dart';

class CharacterItem extends StatelessWidget {
  const CharacterItem({Key? key, required this.characterModel})
      : super(key: key);
  final CharacterModel characterModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: const EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, TextManager.charactersDetailsScreen,
              arguments: characterModel);
        },
        child: GridTile(
          footer: Hero(
            tag: '${characterModel.charId}',
            child: Container(
              width: double.infinity,
              color: Colors.black54,
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Text(
                '${characterModel.name}',
                style: const TextStyle(
                    height: 1.3,
                    fontSize: 16,
                    color: ColorManager.white,
                    fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          child: Container(
            color: ColorManager.grey,
            child: characterModel.image!.isNotEmpty
                ? FadeInImage.assetNetwork(
                    width: double.infinity,
                    height: double.infinity,
                    placeholder: 'assets/images/loading.GIF',
                    image: '${characterModel.image}',
                    fit: BoxFit.cover,
                  )
                : Image.asset('assets/images/placeholder.JPEG'),
          ),
        ),
      ),
    );
  }
}
