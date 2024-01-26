import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notification_app/models/model.dart';
import 'package:notification_app/screens/add_new_item/components/select_icon_bottom_sheet.dart';
import 'package:notification_app/services/get_storage_service.dart';
import 'package:uuid/uuid.dart';

class AddNewItemController extends GetxController with WidgetsBindingObserver {
  dynamic argumentData = Get.arguments;
  GetStorageService getStorageService = Get.find();
  final titleTextController = TextEditingController();
  final fieldOneController = TextEditingController();
  final fieldTwoController = TextEditingController();
  final fieldThreeController = TextEditingController();
  final fieldFourController = TextEditingController();

  DateTime initialDateTime = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
      DateTime.now().hour,
      DateTime.now().minute,
      DateTime.now().second);

  final formAddKey = GlobalKey<FormState>();

  final FocusNode focusNode = FocusNode();

  RxBool isConfirm = false.obs;
  RxBool isKeyboardOpen = false.obs;
  RxInt selectedIconColor = 0.obs;
  RxString selectedIconString = "".obs;
  bool isEdit = false;
  RxBool isRepeat = false.obs;
  int? indexItem;
  int indexScreen = 0;

  List<String?> timedList = List.filled(4, '');

  @override
  void onInit() {
    isEdit = argumentData[0]['isEdit'];
    isRepeat.value = argumentData[2]['isRepeat'];
    indexScreen = argumentData[3]['indexScreen'];
    getData();
    WidgetsBinding.instance.addObserver(this);

    super.onInit();
  }

  getData() {
    if (isEdit) {
      indexItem = argumentData[1]['index'];
      if (!isRepeat.value) {
        titleTextController.text =
            getStorageService.taskList.value.items[indexItem!].name!;
        List<String> parts =
            getStorageService.taskList.value.items[indexItem!].time!.split(':');

        String hours = parts[0];
        String minutes = parts[1];

        fieldOneController.text = hours[0];
        fieldTwoController.text = hours[1];
        fieldThreeController.text = minutes[0];
        fieldFourController.text = minutes[1];
        selectedIconColor.value =
            getStorageService.taskList.value.items[indexItem!].iconColor!;
        selectedIconString.value =
            getStorageService.taskList.value.items[indexItem!].icon!;
        onConfirm();
      } else {
        if (indexScreen == 0) {
          titleTextController.text =
              getStorageService.taskOneMinuteList.value.items[indexItem!].name!;
          selectedIconColor.value = getStorageService
              .taskOneMinuteList.value.items[indexItem!].iconColor!;
          selectedIconString.value =
              getStorageService.taskOneMinuteList.value.items[indexItem!].icon!;
        }
        if (indexScreen == 1) {
          titleTextController.text = getStorageService
              .taskThreeMinuteList.value.items[indexItem!].name!;
          selectedIconColor.value = getStorageService
              .taskThreeMinuteList.value.items[indexItem!].iconColor!;
          selectedIconString.value = getStorageService
              .taskThreeMinuteList.value.items[indexItem!].icon!;
        }
        if (indexScreen == 2) {
          titleTextController.text = getStorageService
              .taskFiveMinuteList.value.items[indexItem!].name!;
          selectedIconColor.value = getStorageService
              .taskFiveMinuteList.value.items[indexItem!].iconColor!;
          selectedIconString.value = getStorageService
              .taskFiveMinuteList.value.items[indexItem!].icon!;
        }
      }
    }
  }

  @override
  void onClose() {
    WidgetsBinding.instance.removeObserver(this);
    super.onClose();
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    final value = WidgetsBinding.instance.window.viewInsets.bottom;
    isKeyboardOpen.value = value > 0;
  }

  void nextField({
    required String value,
    required int position,
  }) {
    if (value.isNotEmpty &&
        // !fieldThreeController.text.contains('\u200b') &&
        position < 3) {
      timedList[position] = value;
      focusNode.nextFocus();
    } else if (value.isEmpty && position > 0) {
      fieldOneController.text = '';
      fieldTwoController.text = '';
      fieldThreeController.text = '';
      fieldFourController.text = '';
    }
    onConfirm();
  }

  void checkTextfield() {
    if (!isRepeat.value) {
      if (fieldOneController.text.isNotEmpty &&
          fieldTwoController.text.isNotEmpty &&
          fieldThreeController.text.isNotEmpty &&
          fieldFourController.text.isNotEmpty &&
          titleTextController.text.isNotEmpty) {
        isConfirm.value = true;
      } else {
        isConfirm.value = false;
      }
    } else {
      if (titleTextController.text.isNotEmpty) {
        isConfirm.value = true;
      } else {
        isConfirm.value = false;
      }
    }
  }

  void onConfirm() {
    if (fieldOneController.text.isNotEmpty &&
        fieldTwoController.text.isNotEmpty &&
        fieldThreeController.text.isNotEmpty &&
        fieldFourController.text.isNotEmpty &&
        titleTextController.text.isNotEmpty) {
      isConfirm.value = true;
    } else {
      isConfirm.value = false;
    }
  }

  addIcon(selectedColor, selectedIcon) {
    selectedIconColor.value = selectedColor;
    selectedIconString.value = selectedIcon;
    Get.back();
  }

  bool isTimeNotLessThanCurrent(String inputTime) {
    DateTime now = DateTime.now();
    List<String> timeParts = inputTime.split(':');
    int hour = int.parse(timeParts[0]);
    int minute = int.parse(timeParts[1]);
    DateTime inputDateTime =
        DateTime(now.year, now.month, now.day, hour, minute);
    return inputDateTime.isAfter(now) || inputDateTime.isAtSameMomentAs(now);
  }

  onBottomSheet() {
    Get.bottomSheet(SelectIconBottomSheet(
      onPressed: (selectedColor, selectedIcon) {
        addIcon(selectedColor, selectedIcon);
      },
    ), isScrollControlled: true)
        .then((value) {});
  }

  addRepeatItem() {
    final isValid = formAddKey.currentState!.validate();
    if (isValid && titleTextController.text.isNotEmpty) {
      if (!isEdit) {
        Items map = Items(
            id: const Uuid().v1(),
            name: titleTextController.text,
            date: DateTime.now(),
            icon: selectedIconString.value,
            iconColor: selectedIconColor.value);
        if (indexScreen == 0) {
          getStorageService.taskOneMinuteList.value.items.add(map);
        }
        if (indexScreen == 1) {
          getStorageService.taskThreeMinuteList.value.items.add(map);
        }
        if (indexScreen == 2) {
          getStorageService.taskFiveMinuteList.value.items.add(map);
        }
      } else {
        if (indexScreen == 0) {
          getStorageService.taskOneMinuteList.value.items[indexItem!].name =
              titleTextController.text;

          getStorageService.taskOneMinuteList.value.items[indexItem!].icon =
              selectedIconString.value;
          getStorageService.taskOneMinuteList.value.items[indexItem!]
              .iconColor = selectedIconColor.value;
          getStorageService.taskOneMinuteList.value.items[indexItem!].date =
              DateTime.now();
        }
        if (indexScreen == 1) {
          getStorageService.taskThreeMinuteList.value.items[indexItem!].name =
              titleTextController.text;

          getStorageService.taskThreeMinuteList.value.items[indexItem!].icon =
              selectedIconString.value;
          getStorageService.taskThreeMinuteList.value.items[indexItem!]
              .iconColor = selectedIconColor.value;
          getStorageService.taskThreeMinuteList.value.items[indexItem!].date =
              DateTime.now();
        }
        if (indexScreen == 2) {
          getStorageService.taskFiveMinuteList.value.items[indexItem!].name =
              titleTextController.text;

          getStorageService.taskFiveMinuteList.value.items[indexItem!].icon =
              selectedIconString.value;
          getStorageService.taskFiveMinuteList.value.items[indexItem!]
              .iconColor = selectedIconColor.value;
          getStorageService.taskFiveMinuteList.value.items[indexItem!].date =
              DateTime.now();
        }
      }
      getStorageService.addPush();
      getStorageService.dataSave();
      Get.back();
    } else {
      Get.snackbar(
        'Error',
        'Please enter the title',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  addItem() {
    FocusScope.of(Get.context!).unfocus();
    onConfirm();
    final isValid = formAddKey.currentState!.validate();

    if (isValid && isConfirm.value) {
      if (int.parse(fieldOneController.text) >= 3 ||
          int.parse(fieldThreeController.text) >= 6) {
        Get.snackbar(
          'Error',
          'Please enter the correct time',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      } else {
        String inputTime =
            '${fieldOneController.text}${fieldTwoController.text}:${fieldThreeController.text}${fieldFourController.text}';
        int hour =
            int.parse('${fieldOneController.text}${fieldTwoController.text}');
        int minute = int.parse(
            '${fieldThreeController.text}${fieldFourController.text}');

        initialDateTime = DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day, hour, minute);
        if (isTimeNotLessThanCurrent(inputTime)) {
          if (!isEdit) {
            Items map = Items(
                id: const Uuid().v1(),
                time: inputTime,
                date: initialDateTime,
                name: titleTextController.text,
                icon: selectedIconString.value,
                iconColor: selectedIconColor.value);

            getStorageService.taskList.value.items.add(map);
          } else {
            getStorageService.taskList.value.items[indexItem!].name =
                titleTextController.text;
            getStorageService.taskList.value.items[indexItem!].time = inputTime;
            getStorageService.taskList.value.items[indexItem!].icon =
                selectedIconString.value;
            getStorageService.taskList.value.items[indexItem!].iconColor =
                selectedIconColor.value;
            getStorageService.taskList.value.items[indexItem!].date =
                initialDateTime;
          }
          getStorageService.dataSave();
          getStorageService.addPush();

          Get.back();
        } else {
          Get.snackbar(
            'Error',
            'Please enter the correct time',
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        }
      }
    } else {
      // isErrorMessage.value = true;
    }
  }
}
