// ignore_for_file: use_build_context_synchronously

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:online_market/widgets/text_widgets/middle_text_widget.dart';
import 'package:online_market/widgets/user_page_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    //final selectedLanguage = await _getSelectedLanguage();
    //final themeMode = await _getThemeMode();
    setState(() {
      _sections = [
        Section(
          isNotificationsOn
              ? Icons.notifications_active
              : Icons.notifications_off,
          'Notifications',
        ),
        Section(Icons.chat, 'Keep in touch'),
        Section(Icons.info, 'About us'),
        Section(Icons.language, 'Language'),
        Section(Icons.dark_mode_outlined, 'Theme'),
        Section(Icons.delivery_dining, 'Delivery'),
      ];
      //_themeMode = themeMode;
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
    return prefs.getString('selected_language') ?? 'English';
  }

  Future<void> _setSelectedLanguage(String language) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('selected_language', language);
    _initializeSections();
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
          const MiddleTextWidget(widgetText: 'Profile'),
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
                  final section = _sections[index];
                  return UserPageWidget(
                    icon: section.icon,
                    label: section.label,
                    onTap: () {
                      if (section.label == 'Notifications') {
                        _showNotificationDialog(context);
                      } else if (section.label == 'Keep in touch') {
                        _showContactInfoDialog(context);
                      } else if (section.label == 'About us') {
                        _showAboutUsDialog(context);
                      } else if (section.label == 'Language') {
                        _showLanguageDialog(context);
                      } else if (section.label == 'Theme') {
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
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Notifications'),
          content:
              const Text('Do you want to turn on or turn off notifications?'),
          actions: [
            TextButton(
              onPressed: () {
                _setNotificationStatus(false);
                Navigator.of(context).pop();
              },
              child: const Text('Turn Off'),
            ),
            TextButton(
              onPressed: () {
                _setNotificationStatus(true);
                Navigator.of(context).pop();
              },
              child: const Text('Turn On'),
            ),
          ],
        );
      },
    );
  }

  void _showContactInfoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Keep in touch'),
          content: const Text(
              'You can reach us at: \nEmail: contact@example.com\nPhone: +123 456 7890'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _showAboutUsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('About us'),
          content: const Text(
              'Home address: \nStreet: 123 Main St\nCity: Ashgabat\nCountry: Turkmenistan'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _showLanguageDialog(BuildContext context) async {
    final selectedLanguage = await _getSelectedLanguage();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Choose Language'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const MiddleTextWidget(
                  widgetText: 'English',
                ),
                leading: Radio<String>(
                  value: 'English',
                  groupValue: selectedLanguage,
                  onChanged: (String? value) {
                    if (value != null) {
                      _setSelectedLanguage(value);
                      Navigator.of(context).pop();
                    }
                  },
                ),
              ),
              ListTile(
                title: const MiddleTextWidget(
                  widgetText: 'Turkish',
                ),
                leading: Radio<String>(
                  value: 'Turkish',
                  groupValue: selectedLanguage,
                  onChanged: (String? value) {
                    if (value != null) {
                      _setSelectedLanguage(value);
                      Navigator.of(context).pop();
                    }
                  },
                ),
              ),
              ListTile(
                title: const MiddleTextWidget(widgetText: 'Russian'),
                leading: Radio<String>(
                  value: 'Russian',
                  groupValue: selectedLanguage,
                  onChanged: (String? value) {
                    if (value != null) {
                      _setSelectedLanguage(value);
                      Navigator.of(context).pop();
                    }
                  },
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void _showThemeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Choose Theme'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RadioListTile<AdaptiveThemeMode>(
                title: const MiddleTextWidget(widgetText: 'Light Theme'),
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
                title: const MiddleTextWidget(widgetText: 'Dark Theme'),
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
                title: const MiddleTextWidget(widgetText: 'System Theme'),
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
              child: const Text('Cancel'),
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
