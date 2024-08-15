import 'dart:developer';

import 'package:online_market/core/network/dio_helper.dart';
import 'package:online_market/data/categories_repository/dto/Categories_dto.dart';

class CategoriesRepositroy {
  final _dio = DioHelper.instance;

  Future<CategoriesDto> categoriesrepository() async {
    try {
      final response = await _dio.get(
        "categories",
      );

      Map<String, dynamic> data = response.data;

      return CategoriesDto.fromJson(data);
    } catch (e) {
      log(e.toString());
      throw Exception('Failed to fetch genres $e');
    }
  }
}
