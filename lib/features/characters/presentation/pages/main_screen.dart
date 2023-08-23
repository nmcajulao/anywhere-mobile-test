import 'package:anywhere_mobile_test/config/colors/app_colors.dart';
import 'package:anywhere_mobile_test/core/resources/app_package_info.dart';
import 'package:anywhere_mobile_test/features/characters/presentation/widgets/details/character_details_main_widget.dart';
import 'package:anywhere_mobile_test/features/characters/presentation/widgets/list/character_main_widget.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import '../../../../../flavors.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final TextEditingController _animSearchBarTextController =
      TextEditingController();

  @override
  void dispose() {
    _animSearchBarTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    var useMobileLayout = shortestSide < 600;

    return Scaffold(
      appBar: _getAppBar(context),
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: (useMobileLayout)
            ? CharacterMainWidget(
                animSearchBarTextController: _animSearchBarTextController,
              )
            : Row(
                children: [
                  Expanded(
                    child: CharacterMainWidget(
                      animSearchBarTextController: _animSearchBarTextController,
                      isUsingMobileLayout: false,
                    ),
                  ),
                  const Expanded(
                    child: CharacterDetailsMainWidget(
                      isUsingMobileLayout: false,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

AppBar _getAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: AppColors.secondaryColor,
    title: Text(F.title),
    automaticallyImplyLeading: false,
    actions: [
      IconButton(
        onPressed: () => showDialog(
          context: context,
          builder: (BuildContext context) {
            return _getAlertDialog(context);
          },
        ),
        icon: const Icon(
          EvaIcons.infoOutline,
        ),
      ),
    ],
  );
}

AlertDialog _getAlertDialog(BuildContext context) {
  return AlertDialog(
    backgroundColor: Colors.transparent,
    elevation: 0,
    contentPadding: EdgeInsets.zero,
    content: Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            AppColors.secondaryColor,
            AppColors.customSecondaryColorOne,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "App Details",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            AppPackageInfo.getAppName,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Text(
            AppPackageInfo.getPackageName,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(
              foregroundColor: AppColors.secondaryColor,
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              'Close',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
