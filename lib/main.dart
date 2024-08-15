import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:online_market/splash_screen.dart';
import 'package:online_market/utils/app_themes.dart';

import 'core/network/di/app_injections.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  await AppInjections.registerInjections();
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





//dark and light mode switcher
// Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   const Text('Light'),
//                   const SizedBox(width: 10),
//                   Switch(
//                     value: AdaptiveTheme.of(context).mode.isDark,
//                     onChanged: (value) {
//                       if (value) {
//                         AdaptiveTheme.of(context).setDark();
//                       } else {
//                         AdaptiveTheme.of(context).setLight();
//                       }
//                     },
//                   ),
//                   const SizedBox(width: 10),
//                   const Text('Dark'),
//                 ],
//               ),
