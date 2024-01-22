import 'package:get/get.dart';
import 'package:notification_app/services/get_storage_service.dart';

class HomeController extends SuperController with GetTickerProviderStateMixin {
  GetStorageService getStorageService = Get.find();
  RxInt currentIndex = 0.obs;

  onEdit(index) {
    Get.toNamed('/add', arguments: [
      {"isEdit": true},
      {"index": index},
      {"isRepeat": false},
      {"indexScreen": 4},
    ])!
        .then((value) => getStorageService.removePastDates());
  }

  onDeleteItem(index) {
    getStorageService.taskList.value.items.removeAt(index);
    getStorageService.addPush();
    getStorageService.taskList.refresh();
    getStorageService.dataSave();
  }

  @override
  void onDetached() {
    // TODO: implement onDetached
  }

  @override
  void onHidden() {
    // TODO: implement onHidden
  }

  @override
  void onInactive() {
    // TODO: implement onInactive
  }

  @override
  void onPaused() {
    // TODO: implement onPaused
  }

  @override
  void onResumed() {
    getStorageService.removePastDates();
    // TODO: implement onResumed
  }
}
