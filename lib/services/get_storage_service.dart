import 'dart:convert';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:notification_app/models/model.dart';
import 'package:notification_app/models/push_model.dart';
import 'package:notification_app/services/push_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetStorageService extends GetxService {
  late final SharedPreferences prefs;

  Rx<MainModel> taskList = MainModel(items: []).obs;
  Rx<MainModel> taskOneMinuteList = MainModel(items: []).obs;
  Rx<MainModel> taskThreeMinuteList = MainModel(items: []).obs;
  Rx<MainModel> taskFiveMinuteList = MainModel(items: []).obs;

  Future init() async {
    prefs = await SharedPreferences.getInstance();
    await dataLoad();
    return this;
  }

  dataLoad() async {
    final prefs = await SharedPreferences.getInstance();

    taskList.value = prefs.getString('task_list') == null
        ? MainModel(items: [])
        : dataFromJson(prefs.getString('task_list')!);
    taskOneMinuteList.value = prefs.getString('one_minute_list') == null
        ? MainModel(items: [])
        : dataFromJson(prefs.getString('one_minute_list')!);
    taskThreeMinuteList.value = prefs.getString('three_minute_list') == null
        ? MainModel(items: [])
        : dataFromJson(prefs.getString('three_minute_list')!);
    taskFiveMinuteList.value = prefs.getString('five_minute_list') == null
        ? MainModel(items: [])
        : dataFromJson(prefs.getString('five_minute_list')!);
    addPush();
    removePastDates();
  }

  dataSave() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('task_list', jsonEncode(taskList.value));
    await prefs.setString(
        'one_minute_list', jsonEncode(taskOneMinuteList.value));
    await prefs.setString(
        'three_minute_list', jsonEncode(taskThreeMinuteList.value));
    await prefs.setString(
        'five_minute_list', jsonEncode(taskFiveMinuteList.value));
  }

  void removePastDates() {
    taskList.value.items.removeWhere((el) {
      if (el.date == null) return false;
      return el.date!.isBefore(DateTime.now());
    });
    taskList.refresh();
  }

  addPush() async {
    PushService pushService = Get.find();
    List<PushModel> result = [];
    taskList.value.items.forEach((element) async {
      if (element.time != null) {
        result.addAll(addItemPush(
            element.name!, element.date!, element.time!, element.id));
      }
    });
    if (taskOneMinuteList.value.items.isNotEmpty) {
      for (var element in taskOneMinuteList.value.items) {
        for (int j = 0; j < 64; j++) {
          result.addAll(addItemPush(element.name!,
              element.date!.add(Duration(minutes: 1 * j)), "", element.id));
        }
      }
    }

    if (taskThreeMinuteList.value.items.isNotEmpty) {
      for (var element in taskThreeMinuteList.value.items) {
        for (int j = 0; j < 64; j++) {
          result.addAll(addItemPush(element.name!,
              element.date!.add(Duration(minutes: 3 * j)), "", element.id));
        }
      }
    }

    if (taskFiveMinuteList.value.items.isNotEmpty) {
      for (var element in taskFiveMinuteList.value.items) {
        for (int j = 0; j < 64; j++) {
          result.addAll(addItemPush(element.name!,
              element.date!.add(Duration(minutes: 5 * j)), "", element.id));
        }
      }
    }

    result.removeWhere(
        (element) => element.date?.isBefore(DateTime.now()) ?? true);
    result.sort((a, b) {
      return b.date?.compareTo(a.date!) ?? 1;
    });
    result = result.reversed.toList();
    result = result.sublist(0, result.length > 64 ? 64 : result.length);
    final List<PendingNotificationRequest> pendingNotificationRequests =
        await pushService.flutterLocalNotificationsPlugin
            .pendingNotificationRequests();
    for (var pending in pendingNotificationRequests) {
      pushService.flutterLocalNotificationsPlugin.cancel(pending.id);
    }

    int id = prefs.getInt('push_id') ?? 0;

    result.forEach((element) async {
      await pushService.showScheduledNotification(
        payload: jsonEncode(element.payload),
        id: id++,
        title: element.title,
        body: element.body,
        seconds: element.date!.difference(DateTime.now()).inSeconds,
      );
    });
    prefs.setInt('push_id', id);
  }

  List<PushModel> addItemPush(
      String body, DateTime time, String notificationTime, String id) {
    List<PushModel> result = [];

    result.add(PushModel(
        payload: {'type': 'noti', 'id': id},
        title: 'Noti',
        body: body,
        date: time));
    return result;
  }
}
