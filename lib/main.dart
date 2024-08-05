import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

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
        home: const MainPageContoller(),
      ),
      debugShowFloatingThemeButton: false,
    );
  }
}

class MainPageContoller extends StatefulWidget {
  const MainPageContoller({super.key});

  @override
  State<MainPageContoller> createState() => _MainPageContollerState();
}

class _MainPageContollerState extends State<MainPageContoller> {
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        items: <Widget>[
          Image.asset(
            'assets/icons/home.png',
            color: _page == 0 ? Colors.white : Colors.grey,
          ),
          Image.asset(
            'assets/icons/favorite.png',
            color: _page == 1 ? Colors.white : Colors.grey,
          ),
          Image.asset(
            'assets/icons/bag.png',
            color: _page == 2 ? Colors.white : Colors.grey,
          ),
          Image.asset(
            'assets/icons/search.png',
            color: _page == 3 ? Colors.white : Colors.grey,
          ),
          Image.asset(
            'assets/icons/user.png',
            color: _page == 4 ? Colors.white : Colors.grey,
          ),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.blue,
        backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
        letIndexChange: (index) => true,
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(_page.toString(), style: TextStyle(fontSize: 160)),
              ElevatedButton(
                child: Text('Go To Page of index 1'),
                onPressed: () {
                  final CurvedNavigationBarState? navBarState =
                      _bottomNavigationKey.currentState;
                  navBarState?.setPage(1);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Home Page'),
//       ),
//       body: Center(
//         child: Text('This is the Home Page'),
//       ),
//     );
//   }
// }

// class ProfilePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Profile Page'),
//       ),
//       body: Center(
//         child: Text('This is the Profile Page'),
//       ),
//     );
//   }
// }

// class SettingsPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Settings Page'),
//       ),
//       body: Center(
//         child: Text('This is the Settings Page'),
//       ),
//     );
//   }
// }


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
