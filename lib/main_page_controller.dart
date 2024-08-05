import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

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
