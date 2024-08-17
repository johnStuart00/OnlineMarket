import 'dart:io';

import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:online_market/data/models/favourity_model.dart';
import 'package:online_market/splash_screen.dart';
import 'package:online_market/utils/app_themes.dart';
import 'package:path_provider/path_provider.dart';

import 'core/network/di/app_injections.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  await AppInjections.registerInjections();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  Directory directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(FavouritymodelAdapter());
  await Hive.openBox<Favourity_model>('favourity');
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnlineMarket(
        savedThemeMode: savedThemeMode,
      ),
    ),
  );
}

class OnlineMarket extends StatelessWidget {
  final AdaptiveThemeMode? savedThemeMode;
  const OnlineMarket({
    super.key,
    this.savedThemeMode,
  });

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: AppThemes.lightTheme,
      dark: AppThemes.darkTheme,
      initial: savedThemeMode ?? AdaptiveThemeMode.system,
      builder: (theme, darkTheme) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Han Moda',
          theme: theme,
          darkTheme: darkTheme,
          home: const SplashScreen()),
    );
  }
}
