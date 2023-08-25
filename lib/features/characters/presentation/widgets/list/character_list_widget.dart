import 'package:anywhere_mobile_test/core/widgets/loader_widget.dart';
import 'package:anywhere_mobile_test/features/characters/presentation/bloc/character_details/character_details_bloc.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/error_widget.dart';
import '../../../domain/entities/character.dart';
import '../../bloc/character_list/character_bloc.dart';
import '../../pages/mobile/mobile_character_details_screen.dart';

class CharacterListWidget extends StatelessWidget {
  final bool isUsingMobileLayout;

  const CharacterListWidget({
    this.isUsingMobileLayout = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharacterBloc, CharacterState>(
      builder: (context, state) {
        if (state is CharacterLoading || state is CharacterInitial) {
          return const AppLoaderWidget();
        } else if (state is CharacterError) {
          return const AppErrorWidget();
        } else if (state is CharacterDone) {
          return _buildDoneWidget(
            state: state,
            context: context,
            isUsingMobileLayout: isUsingMobileLayout,
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}

Widget _buildDoneWidget({
  required CharacterDone state,
  required BuildContext context,
  required bool isUsingMobileLayout,
}) {
  return Expanded(
    child: ListView(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      children: [
        for (CharacterEntity instance in (state.characters ?? []))
          GestureDetector(
            onTap: () {
              // * fires an event to the character details page where the passed character instance is set
              context.read<CharacterDetailsBloc>().add(
                    SetCharacterDetails(
                      characterEntity: instance,
                    ),
                  );

              // * Redirects the user if the app is launched on a mobile layout
              if (isUsingMobileLayout) {
                //
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const MobileCharacterDetailsScreen(),
                ));
              }
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                //set border radius more than 50% of height and width to make circle
              ),
              margin: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 15,
              ),
              elevation: 5,
              shadowColor: Colors.grey.withOpacity(0.30),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 15,
                ),
                child: Row(
                  children: [
                    Text(
                      instance.title,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      EvaIcons.arrowForwardOutline,
                      size: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    ),
  );
}
