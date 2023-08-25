import 'package:anywhere_mobile_test/config/colors/app_colors.dart';
import 'package:anywhere_mobile_test/core/constants/constants.dart';
import 'package:anywhere_mobile_test/features/characters/presentation/bloc/character_details/character_details_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_shadow/simple_shadow.dart';

import '../../../../../core/widgets/error_widget.dart';
import '../../../../../core/widgets/loader_widget.dart';

class CharacterDetailsMainWidget extends StatefulWidget {
  final bool isUsingMobileLayout;

  const CharacterDetailsMainWidget({
    this.isUsingMobileLayout = true,
    super.key,
  });

  @override
  State<CharacterDetailsMainWidget> createState() =>
      _CharacterDetailsMainWidgetState();
}

class _CharacterDetailsMainWidgetState
    extends State<CharacterDetailsMainWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharacterDetailsBloc, CharacterDetailsState>(
      builder: (context, state) {
        if (state is CharacterDetailsLoading ||
            state is CharacterDetailsInitial) {
          return const AppLoaderWidget();
        } else if (state is CharacterDetailsError) {
          return const AppErrorWidget();
        } else if (state is CharacterDetailsDone) {
          return _getDoneWidget(
            context: context,
            state: state,
            isUsingMobileLayout: widget.isUsingMobileLayout,
          );
        }

        return const AppErrorWidget();
      },
    );
  }
}

Widget _getDoneWidget({
  required BuildContext context,
  required CharacterDetailsDone state,
  required bool isUsingMobileLayout,
}) {
  return Column(
    children: [
      const SizedBox(
        height: 10,
      ),
      Row(
        children: [
          (isUsingMobileLayout)
              ? Expanded(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      icon: const Icon(
                        EvaIcons.arrowBackOutline,
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                )
              : const Spacer(),
          Expanded(
            flex: 3,
            child: Text(
              state.characterEntity.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
          ),
          const Spacer(),
          // const Spacer(),
        ],
      ),
      const SizedBox(
        height: 10,
      ),
      Expanded(
        child: Column(
          children: [
            Center(
              child: SimpleShadow(
                opacity: 0.6, // Default: 0.5
                color: Colors.black, // Default: Black
                offset: const Offset(5, 5), // Default: Offset(2, 2)
                sigma: 7,
                child: CachedNetworkImage(
                  imageUrl:
                      AppConstants.imagebaseURL + state.characterEntity.image,
                  height: MediaQuery.of(context).size.height * 0.40,
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                  errorWidget: (context, str, val) => Image.asset(
                    "assets/images/placeholder.png",
                  ),
                ), // Default: 2
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.secondaryColor,
                ),
                child: ListView(
                  padding: const EdgeInsets.all(
                    20,
                  ),
                  children: [
                    Text(
                      state.characterEntity.description,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                        color: Colors.white,
                        letterSpacing: 1.5,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )
    ],
  );
}
