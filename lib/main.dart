import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notification_app/routes.dart';
import 'package:notification_app/screens/authorization/authorization_screen.dart';
import 'package:notification_app/services/get_storage_service.dart';
import 'package:notification_app/services/push_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(const MyApp());
}

Future<void> initServices() async {
  await Get.putAsync<PushService>(() async => await PushService().init(true));
  await Get.putAsync<GetStorageService>(
      () async => await GetStorageService().init());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'notification_app',
      initialRoute: AuthorizationScreen.routeName,
      getPages: AppScreen.routes,
      useInheritedMediaQuery: true,
    );
  }
}
