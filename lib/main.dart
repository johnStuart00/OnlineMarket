import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:online_market/main_page_controller.dart';
import 'package:online_market/splash_screen.dart';
import 'package:page_transition/page_transition.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
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
      light: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorSchemeSeed: Colors.blue,
      ),
      dark: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.blue,
      ),
      initial: savedThemeMode ?? AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => MaterialApp(
          debugShowCheckedModeBanner: false,
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
