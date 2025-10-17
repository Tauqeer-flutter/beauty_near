import 'package:beauty_near/services/storage_service.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

Future<void> initializeServices() async {
  await locator.reset();
  locator.registerSingleton(StorageService());
  await locator<StorageService>().init();
}
