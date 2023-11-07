
import 'package:dio/dio.dart';

class RestClient {
  final Dio _dio = Dio();

  static final RestClient _instanse = RestClient._internal();

  Dio get getDio => _dio;

  factory RestClient() => _instanse;

  RestClient._internal();
}