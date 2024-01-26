import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:notification_app/components/item_card.dart';
import 'package:notification_app/components/main_button.dart';
import 'package:notification_app/constants.dart';
import 'package:notification_app/screens/home/home_controller.dart';

class HomeBodyOneTime extends GetView<HomeController> {
  const HomeBodyOneTime({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Obx(() {
                return controller
                        .getStorageService.taskList.value.items.isNotEmpty
                    ? ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return ItemCard(
                            text: controller.getStorageService.taskList.value
                                .items[index].name!,
                            time: controller.getStorageService.taskList.value
                                .items[index].time!,
                            icon: controller.getStorageService.taskList.value
                                    .items[index].icon ??
                                "",
                            color: controller.getStorageService.taskList.value
                                    .items[index].iconColor ??
                                0,
                            onDelete: () {
                              controller.onDeleteItem(index);
                            },
                            onEdit: () {
                              controller.onEdit(index);
                            },
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            height: 16,
                          );
                        },
                        itemCount: controller
                            .getStorageService.taskList.value.items.length)
                    : const SizedBox();
              }),
              const SizedBox(
                height: 24,
              ),
              MainButton(
                onPressed: () {
                  Get.toNamed('/add', arguments: [
                    {"isEdit": false},
                    {"index": 0},
                    {"isRepeat": false},
                    {"indexScreen": 4},
                  ])!
                      .then((value) =>
                          controller.getStorageService.removePastDates());
                },
                color: kMainAppColor,
                height: 48,
                text: "Add new notification",
                icon: SvgPicture.asset("assets/icons/add_circle.svg"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
