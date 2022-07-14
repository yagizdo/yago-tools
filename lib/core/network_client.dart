import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class NetworkClient {

  // BaseURL of the API
  final String baseUrl = dotenv.get('BASE_URL');

  // Api key
  final String apiKey = dotenv.get('API_KEY');

  // App Base Id
  final String appId = dotenv.get('BASE_ID');

  // Dio instance
  final Dio dio = Dio();
}