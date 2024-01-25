import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:notification_app/screens/home/home_screen.dart';

class AuthorizationController extends GetxController
    with WidgetsBindingObserver {
  final FocusNode focusNode = FocusNode();
  final fieldOneController = TextEditingController();
  final fieldTwoController = TextEditingController();
  final fieldThreeController = TextEditingController();
  final fieldFourController = TextEditingController();

  final FocusNode fieldOneFocusNode = FocusNode();
  final FocusNode fieldTwoFocusNode = FocusNode();
  final FocusNode fieldThreeFocusNode = FocusNode();
  final FocusNode fieldFourFocusNode = FocusNode();

  RxBool isKeyboardOpen = false.obs;

  final formKey = GlobalKey<FormState>();
  late Timer timer;
  RxString timeString = "12:59".obs;
  RxBool isErrorMessage = false.obs;

  RxBool isConfirm = false.obs;

  List<String?> passwordList = List.filled(4, '\u200b');

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
    timeString.value = formatDateTime(DateTime.now());
    timer =
        Timer.periodic(const Duration(minutes: 1), (Timer t) => updateTime());
  }

  @override
  void onClose() {
    WidgetsBinding.instance.removeObserver(this);
    super.onClose();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    final value = WidgetsBinding.instance.window.viewInsets.bottom;
    isKeyboardOpen.value = value > 0;
  }

  void updateTime() {
    final String formattedDateTime = formatDateTime(DateTime.now());
    timeString.value = formattedDateTime;
  }

  String formatDateTime(DateTime dateTime) {
    return DateFormat('HH:mm').format(dateTime);
  }

  void nextField(
      {required String value,
      required int position,
      required FocusNode focusNode}) {
    if (!value.contains('\u200b')) {
      // Здесь выполняется код, если символ \u200b отсутствует в тексте
      print("Символ \u200b отсутствует");
    } else {
      // Здесь выполняется код, если символ \u200b присутствует в тексте
      print("Символ \u200b присутствует");
    }
    if (value.isNotEmpty && position < 3) {
      passwordList[position] = value;
      focusNode.nextFocus();
    } else if (value.isEmpty && position > 0) {
      value = '\u200b';
      // print("previousFocus");
      // Если поле пустое и не является первым полем, переходите к предыдущему полю
      // passwordList[position] = value;
      //
      focusNode.previousFocus();
    }
    onConfirm();
  }

  // void clearField(int position) {
  //   // print(position);
  //   // Очистка текстового поля по его позиции
  //   final TextEditingController controller = [
  //     fieldOneController,
  //     fieldTwoController,
  //     fieldThreeController,
  //     fieldFourController,
  //   ][position];
  //   controller.text = '\u200b';
  //   print(controller.text.contains('\u200b'));
  //   if (controller.text.contains('\u200b')) {
  //     if (fieldOneFocusNode.hasFocus) {
  //       print("fieldOneFocusNode");
  //       // Фокус находится на fieldOneFocusNode
  //       // Вы можете выполнить соответствующие действия здесь
  //     } else if (fieldTwoFocusNode.hasFocus) {
  //       print("fieldTwoFocusNode");
  //       fieldOneFocusNode.requestFocus();
  //     } else if (fieldThreeFocusNode.hasFocus) {
  //       fieldTwoFocusNode.requestFocus();
  //       print("fieldThreeFocusNode");
  //     } else if (fieldFourFocusNode.hasFocus) {
  //       print("fieldFourFocusNode");
  //       fieldThreeFocusNode.requestFocus();
  //     }
  //   }
  // }

  void onConfirm() {
    if (fieldOneController.text.isNotEmpty &&
        fieldTwoController.text.isNotEmpty &&
        fieldThreeController.text.isNotEmpty &&
        fieldFourController.text.isNotEmpty) {
      isConfirm.value = true;
    } else {
      isConfirm.value = false;
    }
  }

  bool compareTimeWithCurrent({
    required String hour1,
    required String minute1,
    required String hour2,
    required String minute2,
  }) {
    String inputTime = '$hour1$minute1:$hour2$minute2';
    return inputTime == timeString.value;
  }

  void checkTime() {
    bool isTimeMatch = compareTimeWithCurrent(
      hour1: fieldOneController.text,
      minute1: fieldTwoController.text,
      hour2: fieldThreeController.text,
      minute2: fieldFourController.text,
    );

    if (isTimeMatch) {
      isErrorMessage.value = false;
      Get.to(() => const HomeScreen());
    } else {
      isErrorMessage.value = true;
    }
  }

  onSendForm() {
    FocusScope.of(Get.context!).unfocus();
    onConfirm();
    final isValid = formKey.currentState!.validate();

    if (isValid && isConfirm.value) {
      checkTime();
    } else {
      isErrorMessage.value = true;
    }
  }
}
