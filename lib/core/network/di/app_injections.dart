import 'package:get_it/get_it.dart';
import 'package:online_market/data/banner_repository/controller/brends_controller.dart';
import 'package:online_market/data/product_repository/controller/product_controller.dart';

class AppInjections {
  static Future<void> registerInjections() async {
    final getIt = GetIt.instance;
    getIt.registerFactory<BrendsController>(() => BrendsController());
    getIt.registerFactory<ProductController>(() => ProductController());
  }
}
