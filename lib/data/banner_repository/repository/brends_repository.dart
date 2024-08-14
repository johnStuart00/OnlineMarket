import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:online_market/core/network/dio_helper.dart';
import 'package:online_market/data/banner_repository/dto/brends_dto.dart';

class BrendsRepository {
  final _dio = DioHelper.instance;

  Future<BrendsDto> purchase_get() async {
    try {
      final response = await _dio.get(
        "brands?limit=20&page=1",
      );

      Map<String, dynamic> data = response.data;

      return BrendsDto.fromJson(data);
    } catch (e) {
      log(e.toString());
      throw Exception('Failed to fetch genres $e');
    }
  }

  // Future<void> purchase_post(Purchase_dto purchase_dto) async {
  //   try {
  //     final response = await _dio.post(_path + '/purchase-book/',
  //         data: purchase_dto.toJson(),
  //         options: Options(extra: {'requiresAuthToken': true}));
  //   } catch (e) {
  //     throw Exception(e);
  //   }
  // }
}
