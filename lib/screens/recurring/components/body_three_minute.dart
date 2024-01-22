import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:notification_app/components/item_card.dart';
import 'package:notification_app/components/main_button.dart';
import 'package:notification_app/constants.dart';
import 'package:notification_app/screens/recurring/recurring_controller.dart';

class BodyThreeMinute extends GetView<RecurringController> {
  const BodyThreeMinute({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Obx(() {
                return controller.getStorageService.taskThreeMinuteList.value
                        .items.isNotEmpty
                    ? ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return ItemCard(
                            text: controller.getStorageService
                                .taskThreeMinuteList.value.items[index].name!,
                            icon: controller
                                    .getStorageService
                                    .taskThreeMinuteList
                                    .value
                                    .items[index]
                                    .icon ??
                                "",
                            color: controller
                                    .getStorageService
                                    .taskThreeMinuteList
                                    .value
                                    .items[index]
                                    .iconColor ??
                                0,
                            onDelete: () {
                              controller.onDeleteItemThree(index);
                            },
                            onEdit: () {
                              controller.onEditThree(index);
                            },
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            height: 16,
                          );
                        },
                        itemCount: controller.getStorageService
                            .taskThreeMinuteList.value.items.length)
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
                    {"indexScreen": 1},
                  ])!
                      .then((value) => controller
                          .getStorageService.taskThreeMinuteList
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
