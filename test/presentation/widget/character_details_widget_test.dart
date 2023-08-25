import 'package:anywhere_mobile_test/core/constants/constants.dart';
import 'package:anywhere_mobile_test/core/widgets/error_widget.dart';
import 'package:anywhere_mobile_test/core/widgets/loader_widget.dart';
import 'package:anywhere_mobile_test/features/characters/domain/entities/character.dart';
import 'package:anywhere_mobile_test/features/characters/presentation/bloc/character_details/character_details_bloc.dart';
import 'package:anywhere_mobile_test/features/characters/presentation/widgets/details/character_details_main_widget.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCharacterDetailsBloc
    extends MockBloc<CharacterDetailsEvent, CharacterDetailsState>
    implements CharacterDetailsBloc {}

void main() {
  late MockCharacterDetailsBloc mockCharacterDetailsBloc;

  setUp(() {
    mockCharacterDetailsBloc = MockCharacterDetailsBloc();
  });

  Widget makeTestableWidget(Widget body) {
    return BlocProvider<CharacterDetailsBloc>(
      create: (context) => mockCharacterDetailsBloc,
      child: MaterialApp(
        home: Scaffold(
          body: body,
        ),
      ),
    );
  }

  const characterSet = CharacterEntity(
      image: '/i/c9dc0e13.png',
      title: 'Professor Frink',
      description: "Some sample small description for this character.");

  testWidgets(
      'CharacterDetailsInitial state of the widget should return the custom AppLoaderWidget',
      (widgetTester) async {
    //arrange
    when(() => mockCharacterDetailsBloc.state)
        .thenReturn(CharacterDetailsInitial());

    //act
    await widgetTester.pumpWidget(
      makeTestableWidget(
        const CharacterDetailsMainWidget(),
      ),
    );

    //assert
    expect(
      find.byType(
        AppLoaderWidget,
      ),
      findsOneWidget,
    );
  });

  testWidgets(
      'CharacterDetailsLoading state of the widget should return the custom AppLoaderWidget',
      (widgetTester) async {
    //arrange
    when(() => mockCharacterDetailsBloc.state)
        .thenReturn(CharacterDetailsLoading());

    //act
    await widgetTester.pumpWidget(
      makeTestableWidget(
        const CharacterDetailsMainWidget(),
      ),
    );

    //assert
    expect(
      find.byType(
        AppLoaderWidget,
      ),
      findsOneWidget,
    );
  });

  testWidgets(
      'CharacterDetailsError state of the widget should return the custom AppErrorWidget',
      (widgetTester) async {
    //arrange
    when(() => mockCharacterDetailsBloc.state)
        .thenReturn(CharacterDetailsError());

    //act
    await widgetTester.pumpWidget(
      makeTestableWidget(
        const CharacterDetailsMainWidget(),
      ),
    );

    //assert
    expect(
      find.byType(
        AppErrorWidget,
      ),
      findsOneWidget,
    );
  });

  testWidgets(
      'CharacterDetailsDone state of the widget should return the custom AppLoaderWidget',
      (widgetTester) async {
    //arrange
    when(() => mockCharacterDetailsBloc.state).thenReturn(
      CharacterDetailsDone(
        characterEntity: characterSet,
      ),
    );

    //act
    await widgetTester.pumpWidget(
      makeTestableWidget(
        const CharacterDetailsMainWidget(),
      ),
    );

    //assert
    expect(
      find.byType(
        CachedNetworkImage,
      ),
      // * should find two of this Widget type (the image itself and its shadow)
      findsWidgets,
    );

    expect(
      find.image(
        CachedNetworkImageProvider(
            AppConstants.imagebaseURL + characterSet.image),
      ),
      // * should find two of this image (the image itself and its shadow)
      findsWidgets,
    );

    expect(
      find.text(
        characterSet.title,
      ),
      findsOneWidget,
    );

    expect(
      find.text(
        characterSet.description,
      ),
      findsOneWidget,
    );
  });
}
