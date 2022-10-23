import 'package:flutter/material.dart';

import '../../core/constance/color_manager.dart';
import '../../data/model/character_model.dart';

class CharactersDetailsScreen extends StatelessWidget {
  const CharactersDetailsScreen({Key? key, required this.characterModel})
      : super(key: key);
  final CharacterModel? characterModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.grey,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //
                    characterInfo(
                        'Job : ', characterModel!.occupation!.join(' / ')),
                    buildDivider(315),
                    //
                    characterInfo('Appeared in : ',
                        '${characterModel!.categoryForTwoSeries}'),
                    buildDivider(250),
                    //
                    characterInfo(
                        'Seasons : ', characterModel!.appearance!.join(' / ')),
                    buildDivider(280),
                    //
                    characterInfo('Status : ', '${characterModel!.status}'),
                    buildDivider(300),
                    //
                    characterModel!.petterCallSaulAppearance!.isEmpty
                        ? const SizedBox()
                        : characterInfo(
                            'Better call saul seasons : ',
                            characterModel!.petterCallSaulAppearance!
                                .join(' / ')),
                    characterModel!.petterCallSaulAppearance!.isEmpty
                        ? const SizedBox()
                        : buildDivider(150),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 500,
              ),
            ]),
          ),
        ],
      ),
    );
  }

  Widget characterInfo(String title, String value) {
    return RichText(
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: const TextStyle(
                color: ColorManager.white,
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
          TextSpan(
            text: value,
            style: const TextStyle(color: ColorManager.white, fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget buildDivider(double endIndent) {
    return Divider(
      color: ColorManager.yellow,
      height: 30,
      endIndent: endIndent,
      thickness: 2,
    );
  }

  buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: ColorManager.grey,
      flexibleSpace: FlexibleSpaceBar(
        background: Hero(
            tag: '${characterModel!.charId}',
            child: Image.network(
              '${characterModel!.image}',
              fit: BoxFit.cover,
            )),
        // centerTitle: true,
        title: Text(
          '${characterModel!.nickname}',
          style: const TextStyle(color: ColorManager.white),
        ),
      ),
    );
  }
}
