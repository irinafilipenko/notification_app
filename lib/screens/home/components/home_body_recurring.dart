import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notification_app/screens/home/components/recurring_card.dart';
import 'package:notification_app/screens/home/home_controller.dart';

import '../../../constants.dart';

class HomeBodyRecurring extends GetView<HomeController> {
  const HomeBodyRecurring({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: List.generate(
          itemList.length,
          (index) => RecuringCard(
                onTap: () {
                  Get.toNamed('/recurring', arguments: [
                    {"index": index}
                  ])!
                      .then((value) =>
                          controller.getStorageService.removePastDates());
                },
                text: itemList[index],
              )),
    ));
  }
}
