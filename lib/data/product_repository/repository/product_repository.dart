import 'dart:developer';

import 'package:online_market/core/network/dio_helper.dart';

import 'package:online_market/data/product_repository/dto/product_dto.dart';

class ProductRepository {
  final _dio = DioHelper.instance;

  Future<ProductDto> product_repository() async {
    try {
      final response = await _dio.get(
        "products",
      );

      Map<String, dynamic> data = response.data;

      return ProductDto.fromJson(data);
    } catch (e) {
      log(e.toString());
      throw Exception('Failed to fetch genres $e');
    }
  }

  Future<ProductDto> brendProduct(String id) async {
    try {
      final response = await _dio.get(
        "products?filter[brandId]=${id}",
      );

      Map<String, dynamic> data = response.data;

      return ProductDto.fromJson(data);
    } catch (e) {
      log(e.toString());
      throw Exception('Failed to fetch genres $e');
    }
  }
}
