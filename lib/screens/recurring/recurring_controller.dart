import 'package:get/get.dart';
import 'package:notification_app/services/get_storage_service.dart';

class RecurringController extends GetxController {
  dynamic argumentData = Get.arguments;
  GetStorageService getStorageService = Get.find();
  RxInt index = 0.obs;

  @override
  void onInit() {
    index.value = argumentData[0]['index'];

    super.onInit();
  }

  onEditOne(index) {
    Get.toNamed('/add', arguments: [
      {"isEdit": true},
      {"index": index},
      {"isRepeat": true},
      {"indexScreen": 0},
    ])!
        .then((value) => getStorageService.taskOneMinuteList.refresh());
  }

  onEditThree(index) {
    Get.toNamed('/add', arguments: [
      {"isEdit": true},
      {"index": index},
      {"isRepeat": true},
      {"indexScreen": 1},
    ])!
        .then((value) => getStorageService.taskThreeMinuteList.refresh());
  }

  onEditFive(index) {
    Get.toNamed('/add', arguments: [
      {"isEdit": true},
      {"index": index},
      {"isRepeat": true},
      {"indexScreen": 2},
    ])!
        .then((value) => getStorageService.taskFiveMinuteList.refresh());
  }

  onDeleteItemOne(index) {
    getStorageService.taskOneMinuteList.value.items.removeAt(index);
    getStorageService.addPush();
    getStorageService.taskOneMinuteList.refresh();
    getStorageService.dataSave();
  }

  onDeleteItemThree(index) {
    getStorageService.taskThreeMinuteList.value.items.removeAt(index);
    getStorageService.addPush();
    getStorageService.taskThreeMinuteList.refresh();
    getStorageService.dataSave();
  }

  onDeleteItemFive(index) {
    getStorageService.taskFiveMinuteList.value.items.removeAt(index);
    getStorageService.addPush();
    getStorageService.taskFiveMinuteList.refresh();
    getStorageService.dataSave();
  }
}
