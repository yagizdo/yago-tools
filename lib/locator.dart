import 'package:yago_tools/core/airtable_client.dart';
import 'package:yago_tools/models/home_view_model.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton(AirtableClient());
  getIt.registerSingleton(HomeViewModel(getIt.get<AirtableClient>()));
}