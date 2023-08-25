import 'package:anywhere_mobile_test/config/theme/app_theme.dart';
import 'package:anywhere_mobile_test/features/characters/presentation/pages/main_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/characters/presentation/bloc/character_details/character_details_bloc.dart';
import 'features/characters/presentation/bloc/character_list/character_bloc.dart';
import 'flavors.dart';
import 'injection_container.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              serviceLocator.get<CharacterBloc>()..add(GetCharacters()),
        ),
        BlocProvider(
          create: (context) => serviceLocator.get<CharacterDetailsBloc>(),
        ),
      ],
      child: MaterialApp(
        title: F.title,
        theme: AppTheme.getThemeData,
        home: _flavorBanner(
          child: const MainScreen(),
          show: kDebugMode,
        ),
      ),
    );
  }

  Widget _flavorBanner({
    required Widget child,
    bool show = true,
  }) =>
      show
          ? Banner(
              location: BannerLocation.topStart,
              message: F.name,
              color: Colors.green.withOpacity(0.6),
              textStyle: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 12.0,
                  letterSpacing: 1.0),
              textDirection: TextDirection.ltr,
              child: child,
            )
          : Container(
              child: child,
            );
}
