import 'package:anywhere_mobile_test/core/widgets/error_widget.dart';
import 'package:anywhere_mobile_test/core/widgets/loader_widget.dart';
import 'package:anywhere_mobile_test/features/characters/domain/entities/character.dart';
import 'package:anywhere_mobile_test/features/characters/presentation/bloc/character_list/character_bloc.dart';
import 'package:anywhere_mobile_test/features/characters/presentation/widgets/list/character_list_main_widget.dart';
import 'package:anywhere_mobile_test/features/characters/presentation/widgets/list/character_list_widget.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCharacterBloc extends MockBloc<CharacterEvent, CharacterState>
    implements CharacterBloc {}

void main() {
  late MockCharacterBloc mockCharacterBloc;

  setUp(() {
    mockCharacterBloc = MockCharacterBloc();
  });

  Widget makeTestableWidget(Widget body) {
    return BlocProvider<CharacterBloc>(
      create: (context) => mockCharacterBloc,
      child: MaterialApp(
        home: Scaffold(
          body: body,
        ),
      ),
    );
  }

  final characters = [
    const CharacterEntity(
        image: 'sample/image.png',
        title: 'Alice',
        description: "Some sample small description for this character."),
    const CharacterEntity(
        image: 'sample/image.png',
        title: 'Bob',
        description: "Some sample small description for this character."),
    const CharacterEntity(
        image: 'sample/image.png',
        title: 'Charlie',
        description: "Some sample small description for this character."),
  ];

  DioException dioException = DioException(
    requestOptions: RequestOptions(path: '/api/endpoint'),
    response: Response(
      statusCode: 404,
      data: {'error': 'Not found'},
      requestOptions: RequestOptions(path: '/api/endpoint'),
    ),
  );

  testWidgets(
      'CharacterInitial state of the widget should return the custom AppLoaderWidget',
      (widgetTester) async {
    //arrange
    when(() => mockCharacterBloc.state).thenReturn(CharacterInitial());

    //act
    await widgetTester.pumpWidget(
      makeTestableWidget(
        const CharacterListWidget(),
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
      'CharacterLoading state of the widget should return the custom AppLoaderWidget',
      (widgetTester) async {
    //arrange
    when(() => mockCharacterBloc.state).thenReturn(CharacterLoading());

    //act
    await widgetTester.pumpWidget(
      makeTestableWidget(
        const CharacterListWidget(),
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
      'CharacterError state of the widget should return the custom AppErrorWidget',
      (widgetTester) async {
    //arrange
    when(() => mockCharacterBloc.state)
        .thenReturn(CharacterError(dioException));

    //act
    await widgetTester.pumpWidget(
      makeTestableWidget(
        const CharacterListWidget(),
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
      'CharacterDone state of the widget should return the custom AppLoaderWidget',
      (widgetTester) async {
    TextEditingController textEditingController = TextEditingController();

    //arrange
    when(() => mockCharacterBloc.state).thenReturn(CharacterDone(characters));

    //act
    await widgetTester.pumpWidget(
      makeTestableWidget(
        CharacterListMainWidget(
          animSearchBarTextController: textEditingController,
        ),
      ),
    );

    //assert

    // * the list of characters is contained within a Card widget
    expect(
      find.byType(
        Card,
      ),
      findsWidgets,
    );

    expect(
      find.text(
        'Alice',
      ),
      findsOneWidget,
    );

    expect(
      find.text(
        'Bob',
      ),
      findsOneWidget,
    );

    expect(
      find.text(
        'Charlie',
      ),
      findsOneWidget,
    );

    expect(
      find.text(
        'Alpha',
      ),
      findsNothing,
    );
  });
}
