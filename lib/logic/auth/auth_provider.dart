import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:tz/helpers/catch_exceptions.dart';
import 'package:tz/helpers/dio_settings.dart';
import 'package:tz/logic/auth/auth_repository.dart';

class AuthProvider implements AuthRepository {
  late DioSettings _dioSettings;
  late Dio _dio;

  /// И мап для запроса
  late Map<String, dynamic> request;
  static final AuthProvider _instance = AuthProvider.internal();
  factory AuthProvider() => _instance;
  AuthProvider.internal() {
    _dioSettings = DioSettings();
    _dio = _dioSettings.dio;
  }

  @override
  Future<Map<String, dynamic>> login(String login, String password) async {
    // Map<String, String> params = {'login': login, 'password': password};
    try {
      final htmlResponse = await _dio.post(
        '/login/auth',
      );
      final response = jsonDecode(htmlResponse.data);
      return response;
    } catch (e) {
      print(e);
      throw CatchException.convertException(e);
    }
  }
}
