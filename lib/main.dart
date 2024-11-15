
import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:online_market/data/models/favourity_model.dart';
import 'package:online_market/splash_screen.dart';
import 'package:online_market/utils/app_themes.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/network/di/app_injections.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  final prefs = await SharedPreferences.getInstance();
  final selectedLanguage = prefs.getString('selected_language') ?? 'en';
  await AppInjections.registerInjections();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  Hive.initFlutter();
  Hive.registerAdapter(FavouritymodelAdapter());
  await Hive.openBox<Favourity_model>('favourity');
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnlineMarket(
        savedThemeMode: savedThemeMode,
        initialLocale: Locale(selectedLanguage),
      ),
    ),
  );
}

class OnlineMarket extends StatefulWidget {
  final Locale initialLocale;
  final AdaptiveThemeMode? savedThemeMode;

  static void setLocale(BuildContext context, Locale newLocale) {
    final _OnlineMarketState? state =
        context.findAncestorStateOfType<_OnlineMarketState>();
    if (state != null) {
      state.setLocale(newLocale);
    }
  }

  const OnlineMarket({
    super.key,
    this.savedThemeMode,
    required this.initialLocale,
  });

  @override
  State<OnlineMarket> createState() => _OnlineMarketState();
}

class _OnlineMarketState extends State<OnlineMarket> {
  late Locale _locale;

  @override
  void initState() {
    super.initState();
    _locale = widget.initialLocale;
  }

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: AppThemes.lightTheme,
      dark: AppThemes.darkTheme,
      initial: widget.savedThemeMode ?? AdaptiveThemeMode.system,
      builder: (theme, darkTheme) => MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: _locale,
        debugShowCheckedModeBanner: false,
        title: 'Han Moda',
        theme: theme,
        darkTheme: darkTheme,
        home: const SplashScreen(),
      ),
    );
  }
}
