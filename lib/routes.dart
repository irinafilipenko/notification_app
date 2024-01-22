import 'package:get/get.dart';
import 'package:notification_app/bindings.dart';
import 'package:notification_app/screens/add_new_item/add_new_item_screen.dart';
import 'package:notification_app/screens/authorization/authorization_screen.dart';

import 'package:notification_app/screens/category/category_screen.dart';
import 'package:notification_app/screens/home/home_screen.dart';
import 'package:notification_app/screens/recurring/recurring_screen.dart';

class AppScreen {
  static final routes = [
    GetPage(
      name: AuthorizationScreen.routeName,
      page: () => const AuthorizationScreen(),
      binding: Binding(),
    ),
    GetPage(
      name: HomeScreen.routeName,
      page: () => const HomeScreen(),
      binding: Binding(),
    ),
    GetPage(
      name: AddNewIemScreen.routeName,
      page: () => const AddNewIemScreen(),
      binding: Binding(),
    ),
    GetPage(
      name: RecurringScreen.routeName,
      page: () => const RecurringScreen(),
      binding: Binding(),
    ),
    GetPage(
      name: CategoryScreen.routeName,
      page: () => const CategoryScreen(),
      binding: Binding(),
    ),
  ];
}
