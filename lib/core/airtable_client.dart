import 'package:dio/dio.dart';
import 'package:yago_tools/core/network_client.dart';
import 'package:yago_tools/models/app_model.dart';

class AirtableClient extends NetworkClient {

  // Get data
  Future<List<AppModel>> getApps() async {

    List<AppModel> apps = [];

    // Response
    Response response = await dio.get('$baseUrl/v0/$appId/Apps',queryParameters: {"api_key" : apiKey});

    // Parsed list
    List parsedList = response.data['records'];

    apps = parsedList.map((app) => AppModel.fromJson(app)).toList();

    return apps;
  }
}