// ignore_for_file: use_build_context_synchronously

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:online_market/main.dart';
import 'package:online_market/widgets/text_widgets/middle_text_widget.dart';
import 'package:online_market/widgets/user_page_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  late List<Section> _sections = [];
  //late ThemeMode _themeMode;

  @override
  void initState() {
    super.initState();
    _initializeSections();
    _getCurrentThemeMode();
  }

  void _initializeSections() async {
    final isNotificationsOn = await _getNotificationStatus();

    setState(() {
      _sections = [
        Section(
          isNotificationsOn
              ? Icons.notifications_active
              : Icons.notifications_off,
          AppLocalizations.of(context)!.notifications,
        ),
        Section(Icons.chat, AppLocalizations.of(context)!.keep_in_touch),
        Section(Icons.info, AppLocalizations.of(context)!.about_us),
        Section(Icons.language, AppLocalizations.of(context)!.language),
        Section(Icons.dark_mode_outlined, AppLocalizations.of(context)!.theme),
        Section(Icons.delivery_dining, AppLocalizations.of(context)!.delivery),
      ];
    });
  }

  Future<bool> _getNotificationStatus() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('notifications') ?? false;
  }

  Future<void> _setNotificationStatus(bool status) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('notifications', status);
    _initializeSections();
  }

  Future<String> _getSelectedLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('selected_language') ?? 'tr';
  }

  Future<void> _setSelectedLanguage(String language) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('selected_language', language);

    // Set the locale immediately
    OnlineMarket.setLocale(context, Locale(language));
  }

  AdaptiveThemeMode? _themeMode;

  void _getCurrentThemeMode() async {
    _themeMode = await AdaptiveTheme.getThemeMode();
    setState(() {});
  }

  void _changeTheme(AdaptiveThemeMode? mode) {
    setState(() {
      _themeMode = mode;
      if (mode != null) {
        AdaptiveTheme.of(context).setThemeMode(mode);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const SizedBox(height: 20),
          MiddleTextWidget(widgetText: AppLocalizations.of(context)!.profile),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                ),
                itemCount: _sections.length,
                itemBuilder: (BuildContext context, int index) {
                  final apploc = AppLocalizations.of(context);
                  final section = _sections[index];
                  return UserPageWidget(
                    icon: section.icon,
                    label: section.label,
                    onTap: () {
                      if (section.label == apploc!.notifications) {
                        _showNotificationDialog(context);
                      } else if (section.label == apploc.keep_in_touch) {
                        _showContactInfoDialog(context);
                      } else if (section.label == apploc.about_us) {
                        _showAboutUsDialog(context);
                      } else if (section.label == apploc.language) {
                        _showLanguageDialog(context);
                      } else if (section.label == apploc.theme) {
                        _showThemeDialog(context);
                      }
                    },
                  );
                }),
          )
        ]),
      ),
    );
  }

  void _showNotificationDialog(BuildContext context) {
    final apploc = AppLocalizations.of(context);
    final String notifications = apploc!.notifications;
    final String notifications_content = apploc.notifications_content;
    final String turn_off = apploc.turn_off;
    final String turn_on = apploc.turn_on;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: MiddleTextWidget(
            widgetText: notifications,
          ),
          content: MiddleTextWidget(
            widgetText: notifications_content,
          ),
          actions: [
            TextButton(
              onPressed: () {
                _setNotificationStatus(false);
                Navigator.of(context).pop();
              },
              child: MiddleTextWidget(widgetText: turn_off),
            ),
            TextButton(
              onPressed: () {
                _setNotificationStatus(true);
                Navigator.of(context).pop();
              },
              child: MiddleTextWidget(widgetText: turn_on),
            ),
          ],
        );
      },
    );
  }

  void _showContactInfoDialog(BuildContext context) {
    final appLoc = AppLocalizations.of(context);
    final String keepInTouch = appLoc!.keep_in_touch;
    final String keepContent = appLoc.keep_in_touch_content;
    final String close = appLoc.close;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: MiddleTextWidget(widgetText: keepInTouch),
          content: MiddleTextWidget(widgetText: keepContent),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: MiddleTextWidget(widgetText: close),
            ),
          ],
        );
      },
    );
  }

  void _showAboutUsDialog(BuildContext context) {
    final appLoc = AppLocalizations.of(context);
    final String aboutUs = appLoc!.about_us;
    final String aboutContent = appLoc.about_us_content;
    final String close = appLoc.close;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: MiddleTextWidget(widgetText: aboutUs),
          content: MiddleTextWidget(widgetText: aboutContent),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: MiddleTextWidget(widgetText: close),
            ),
          ],
        );
      },
    );
  }

  void _showLanguageDialog(BuildContext context) async {
    final selectedLanguage = await _getSelectedLanguage();
    final appLoc = AppLocalizations.of(context);
    final String language = appLoc!.language;
    final String tkm = appLoc.turkmen;
    final String rus = appLoc.russian;
    final String eng = appLoc.english;
    final String close = appLoc.close;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: MiddleTextWidget(widgetText: language),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RadioListTile<String>(
                title: MiddleTextWidget(widgetText: tkm),
                value: 'tr',
                groupValue: selectedLanguage,
                onChanged: (String? value) {
                  if (value != null) {
                    _setSelectedLanguage(value);
                    OnlineMarket.setLocale(context, const Locale('tr'));
                    Navigator.of(context).pop();
                  }
                },
              ),
              RadioListTile<String>(
                title: MiddleTextWidget(widgetText: rus),
                value: 'ru',
                groupValue: selectedLanguage,
                onChanged: (String? value) {
                  if (value != null) {
                    _setSelectedLanguage(value);
                    OnlineMarket.setLocale(context, const Locale('ru'));
                    Navigator.of(context).pop();
                  }
                },
              ),
              RadioListTile<String>(
                title: MiddleTextWidget(widgetText: eng),
                value: 'en',
                groupValue: selectedLanguage,
                onChanged: (String? value) {
                  if (value != null) {
                    _setSelectedLanguage(value);
                    OnlineMarket.setLocale(context, const Locale('en'));
                    Navigator.of(context).pop();
                  }
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: MiddleTextWidget(widgetText: close),
            ),
          ],
        );
      },
    );
  }

  void _showThemeDialog(BuildContext context) {
    final appLoc = AppLocalizations.of(context);
    final String theme = appLoc!.theme;
    final String light = appLoc.light_theme;
    final String dark = appLoc.dark_theme;
    final String system = appLoc.system_theme;
    final String close = appLoc.close;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: MiddleTextWidget(widgetText: theme),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RadioListTile<AdaptiveThemeMode>(
                title: MiddleTextWidget(widgetText: light),
                value: AdaptiveThemeMode.light,
                groupValue: _themeMode,
                onChanged: (AdaptiveThemeMode? value) {
                  if (value != null) {
                    _changeTheme(value);
                    Navigator.of(context).pop();
                  }
                },
              ),
              RadioListTile<AdaptiveThemeMode>(
                title: MiddleTextWidget(widgetText: dark),
                value: AdaptiveThemeMode.dark,
                groupValue: _themeMode,
                onChanged: (AdaptiveThemeMode? value) {
                  if (value != null) {
                    _changeTheme(value);
                    Navigator.of(context).pop();
                  }
                },
              ),
              RadioListTile<AdaptiveThemeMode>(
                title: MiddleTextWidget(widgetText: system),
                value: AdaptiveThemeMode.system,
                groupValue: _themeMode,
                onChanged: (AdaptiveThemeMode? value) {
                  if (value != null) {
                    _changeTheme(value);
                    Navigator.of(context).pop();
                  }
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: MiddleTextWidget(widgetText: close),
            ),
          ],
        );
      },
    );
  }
}

class Section {
  final IconData icon;
  final String label;

  Section(this.icon, this.label);
}
