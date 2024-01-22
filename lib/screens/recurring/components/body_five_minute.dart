import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:notification_app/components/item_card.dart';
import 'package:notification_app/components/main_button.dart';
import 'package:notification_app/constants.dart';
import 'package:notification_app/screens/recurring/recurring_controller.dart';

class BodyFiveMinute extends GetView<RecurringController> {
  const BodyFiveMinute({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Obx(() {
                return controller.getStorageService.taskFiveMinuteList.value
                        .items.isNotEmpty
                    ? ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return ItemCard(
                            text: controller.getStorageService
                                .taskFiveMinuteList.value.items[index].name!,
                            // time: controller.getStorageService.taskList.value
                            //     .items[index].time!,
                            icon: controller
                                    .getStorageService
                                    .taskFiveMinuteList
                                    .value
                                    .items[index]
                                    .icon ??
                                "",
                            color: controller
                                    .getStorageService
                                    .taskFiveMinuteList
                                    .value
                                    .items[index]
                                    .iconColor ??
                                0,
                            onDelete: () {
                              controller.onDeleteItemFive(index);
                            },
                            onEdit: () {
                              controller.onEditFive(index);
                            },
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            height: 16,
                          );
                        },
                        itemCount: controller.getStorageService
                            .taskFiveMinuteList.value.items.length)
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
                    {"isRepeat": true},
                    {"indexScreen": 2},
                  ])!
                      .then((value) => controller
                          .getStorageService.taskFiveMinuteList
                          .refresh());
                },
                color: kMainAppColor,
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
