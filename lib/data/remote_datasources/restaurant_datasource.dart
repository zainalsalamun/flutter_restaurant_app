import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_restaurant_app/data/models/response/products_response_model.dart';
import 'package:http/http.dart' as http;

import '../../common/constants.dart';

class RestaurantDatasource {
  Future<Either<String, ProductsResponseModel>> getAll() async {
    final response = await http.get(
      Uri.parse('${Constants.baseUrl}/api/restaurants'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      return Right(
        ProductsResponseModel.fromJson(
          jsonDecode(response.body),
        ),
      );
    } else {
      return const Left('API ERROR');
    }
  }

  Future<Either<String, ProductsResponseModel>> getByUserID(
    int userId,
  ) async {
    final response = await http.get(
      Uri.parse(
        '${Constants.baseUrl}/api/restaurants?userId=$userId',
      ),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      return Right(
        ProductsResponseModel.fromJson(
          jsonDecode(response.body),
        ),
      );
    } else {
      return const Left('API ERROR');
    }
  }
}
