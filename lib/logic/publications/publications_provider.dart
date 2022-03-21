import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:tz/helpers/catch_exceptions.dart';
import 'package:tz/helpers/dio_settings.dart';
import 'package:tz/logic/publications/publications_repository.dart';
import 'package:tz/model/model_image_screen.dart';

class PublicationsProvider implements PublicationsRepository {
  late DioSettings _dioSettings;
  late Dio _dio;

  late Map<String, dynamic> request;
  static final PublicationsProvider _instance = PublicationsProvider.internal();
  factory PublicationsProvider() => _instance;
  PublicationsProvider.internal() {
    _dioSettings = DioSettings();
    _dio = _dioSettings.dio;
  }

  @override
  Future<List<PublicationModel>> getPublications() async {
    try {
      final htmlResponse = await _dio.get("publications");
      final response = jsonDecode(htmlResponse.data);
      return response
          .map<PublicationModel>(
              (publication) => PublicationModel.fromJson(publication))
          .toList();
    } catch (e) {
      print(e);
      throw CatchException.convertException(e);
    }
  }
}
