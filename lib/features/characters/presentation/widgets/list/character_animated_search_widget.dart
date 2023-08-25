import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/character_list/character_bloc.dart';

class CharacterAnimatedSearchWidget extends StatelessWidget {
  const CharacterAnimatedSearchWidget({
    super.key,
    required TextEditingController animSearchBarTextController,
  }) : _animSearchBarTextController = animSearchBarTextController;

  final TextEditingController _animSearchBarTextController;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: LayoutBuilder(builder: (context, constraints) {
        return Container(
          padding: const EdgeInsets.only(
            right: 15,
          ),
          child: AnimSearchBar(
            rtl: true,
            autoFocus: true,
            width: constraints.maxHeight * 0.85,
            textController: _animSearchBarTextController,
            onSuffixTap: () {
              /* setState(() {
                  _animSearchBarTextController.clear();
                }); */
            },
            onSubmitted: (value) {
              context.read<CharacterBloc>().add(
                    FilterCharacters(
                      filter: value,
                    ),
                  );
            },
            color: const Color.fromARGB(255, 60, 65, 61),
            searchIconColor: Colors.white,
            textFieldColor: const Color.fromARGB(255, 60, 65, 61),
            textFieldIconColor: Colors.white,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        );
      }),
    );
  }
}
