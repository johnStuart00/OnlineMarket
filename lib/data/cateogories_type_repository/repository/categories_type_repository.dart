import 'dart:developer';

import 'package:online_market/core/network/dio_helper.dart';
import 'package:online_market/data/cateogories_type_repository/dto/categories_types_dto.dart';

class CategoriesTypeRepository {
  final _dio = DioHelper.instance;

  Future<CategoriesTypeDto> product_repository() async {
    try {
      final response = await _dio.get(
        "category-types",
      );

      Map<String, dynamic> data = response.data;

      return CategoriesTypeDto.fromJson(data);
    } catch (e) {
      log(e.toString());
      throw Exception('Failed to fetch genres $e');
    }
  }
}
