import 'package:flutter/material.dart';

import 'character_animated_search_widget.dart';
import 'character_list_widget.dart';

class CharacterMainWidget extends StatelessWidget {
  final TextEditingController animSearchBarTextController;
  final bool isUsingMobileLayout;

  const CharacterMainWidget({
    required this.animSearchBarTextController,
    this.isUsingMobileLayout = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            // * Character List Widget
            CharacterListWidget(
              isUsingMobileLayout: isUsingMobileLayout,
            ),
          ],
        ),

        // * External Search Bar Custom Widget
        Positioned.fill(
          child: CharacterAnimatedSearchWidget(
              animSearchBarTextController: animSearchBarTextController),
        ),
      ],
    );
  }
}
