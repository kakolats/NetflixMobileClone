import 'package:dio/dio.dart';
import 'package:netflix/services/api.dart';

class ApiService{
  final Api api = Api();
  final Dio dio = Dio();
}