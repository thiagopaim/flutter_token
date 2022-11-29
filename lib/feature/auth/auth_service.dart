import 'package:dio/dio.dart';
import 'package:jwt/core/constants.dart';

class Auth {
  final Dio _dio = Dio();

  Future<dynamic> login(String email, String password) async {
    try {
      Response response = await _dio.post(
        '$endpoint/login',
        data: {
          'email': email,
          'password': password,
        },
      );

      return response.data;
    } on DioError catch (error) {
      return error.response!.data;
    }
  }
}
