import 'package:yago_tools/core/airtable_client.dart';
import 'package:mobx/mobx.dart';
import 'package:yago_tools/models/app_model.dart';

part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModel with _$HomeViewModel;

abstract class _HomeViewModel with Store {
  // Constructor with injected PostClient
  _HomeViewModel(AirtableClient client) : _airtableClient = client;

  // Post Client
  late final AirtableClient _airtableClient;

  // Fetch Apps
  @action
  Future<List<AppModel>> fetchApps() async {
    List<AppModel> apps = [];

    apps = await _airtableClient.getApps();

    return apps;
  }
}
