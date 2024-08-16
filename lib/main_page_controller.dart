import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:get_it/get_it.dart';
import 'package:online_market/bag_page/bag_page.dart';
import 'package:online_market/data/banner_repository/controller/brends_controller.dart';
import 'package:online_market/data/cateogories_type_repository/controller/cateogries_type_controller.dart';
import 'package:online_market/data/product_repository/controller/product_controller.dart';
import 'package:online_market/error_page/error_page.dart';
import 'package:online_market/favorite_page/favorite_page.dart';
import 'package:online_market/home_page/home_page.dart';
import 'package:online_market/search_page/search_page.dart';
import 'package:online_market/user_page/user_page.dart';

class MainPageContoller extends StatefulWidget {
  const MainPageContoller({super.key});

  @override
  State<MainPageContoller> createState() => _MainPageContollerState();
}

class _MainPageContollerState extends State<MainPageContoller> {
  int _page = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  final brendcontroller = GetIt.instance<BrendsController>();
  final productcontroller = GetIt.instance<ProductController>();
  final cateogriescontroller = GetIt.instance<CategoriesTypeController>();
  @override
  void initState() {
    // TODO: implement initState
    brendcontroller.fetchData();
    productcontroller.fetchData();
    cateogriescontroller.fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
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
        backgroundColor: Theme.of(context).primaryColor,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
        letIndexChange: (index) => true,
      ),
      body: _getPage(_page),
    );
  }

  // The function for navigate pages
  Widget _getPage(int page) {
    switch (page) {
      case 0:
        return HomePage(
          brendcontroller: brendcontroller,
          cateogriescontroller: cateogriescontroller,
          productcontroller: productcontroller,
        );
      case 1:
        return FavoritePage();
      case 2:
        return const BagPage();
      case 3:
        return SearchPage();
      case 4:
        return const UserPage();
      default:
        return const ErrorPage();
    }
  }
}
