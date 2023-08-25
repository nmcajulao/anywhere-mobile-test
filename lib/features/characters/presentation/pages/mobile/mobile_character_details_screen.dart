import 'package:anywhere_mobile_test/features/characters/presentation/widgets/details/character_details_main_widget.dart';
import 'package:flutter/material.dart';

class MobileCharacterDetailsScreen extends StatefulWidget {
  const MobileCharacterDetailsScreen({
    super.key,
  });

  @override
  State<MobileCharacterDetailsScreen> createState() =>
      _MobileCharacterDetailsScreenState();
}

class _MobileCharacterDetailsScreenState
    extends State<MobileCharacterDetailsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: CharacterDetailsMainWidget(),
      ),
    );
  }
}
