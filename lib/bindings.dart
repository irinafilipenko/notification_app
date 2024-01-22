import 'package:get/get.dart';
import 'package:notification_app/screens/add_new_item/add_new_item_controller.dart';
import 'package:notification_app/screens/authorization/authorization_controller.dart';
import 'package:notification_app/screens/category/category_controller.dart';
import 'package:notification_app/screens/home/home_controller.dart';
import 'package:notification_app/screens/recurring/recurring_controller.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthorizationController>(
      () => AuthorizationController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<AddNewItemController>(
      () => AddNewItemController(),
    );
    Get.lazyPut<RecurringController>(
      () => RecurringController(),
    );
    Get.lazyPut<CategoryTwoController>(
      () => CategoryTwoController(),
    );
  }
}
