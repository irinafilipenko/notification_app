import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:notification_app/constants.dart';
import 'package:notification_app/screens/category/category_controller.dart';
import 'package:notification_app/screens/category/components/item_category.dart';

class CategoryOneBody extends GetView<CategoryTwoController> {
  const CategoryOneBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 56,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Color(0xFFE6E6E6),
                  width: 1.0,
                ),
              ),
            ),
            child: ListTile(
                leading: const Text(
                  "All Trigers",
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: kAppBarColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
                trailing: Obx(() {
                  return GestureDetector(
                      onTap: () {
                        controller.onCheckAll();
                      },
                      child: SvgPicture.asset(controller.isCheckAll.value
                          ? "assets/icons/checkbox.svg"
                          : 'assets/icons/checkbox_empty.svg'));
                })),
          ),
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.categoryList.length,
              itemBuilder: (context, index) {
                return Obx(() {
                  return Column(
                    children: [
                      ItemCategory(
                        onTapMainItem: () {
                          controller.categoryList[index].isSelected =
                              !controller.categoryList[index].isSelected;

                          controller.categoryList.refresh();
                        },
                        onCheck: () {
                          controller.categoryList[index].isCheck =
                              !controller.categoryList[index].isCheck;
                          controller.categoryList.refresh();
                        },
                        title: controller.categoryList[index].title,
                        isCheck: controller.categoryList[index].isCheck,
                        icon: controller.categoryList[index].mainIcon,
                        isSelected: controller.categoryList[index].isSelected,
                      ),
                      Visibility(
                        visible: controller.categoryList[index].isSelected,
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller
                                .categoryList[index].subCategories.length,
                            itemBuilder: (context, ind) {
                              return Column(
                                children: [
                                  ItemCategory(
                                    onTapMainItem: () {
                                      controller.categoryList[index]
                                              .subCategories[ind].isSelected =
                                          !controller.categoryList[index]
                                              .subCategories[ind].isSelected;

                                      controller.categoryList.refresh();
                                    },
                                    onCheck: () {
                                      controller.categoryList[index]
                                              .subCategories[ind].isCheck =
                                          !controller.categoryList[index]
                                              .subCategories[ind].isCheck;
                                      controller.categoryList.refresh();
                                    },
                                    title: controller.categoryList[index]
                                        .subCategories[ind].title,
                                    isCheck: controller.categoryList[index]
                                        .subCategories[ind].isCheck,
                                    fontWeght: controller.categoryList[index]
                                                .subCategories[ind].day ==
                                            "day"
                                        ? FontWeight.w700
                                        : FontWeight.w400,
                                    icon: controller.categoryList[index]
                                        .subCategories[ind].middleIcon,
                                    isSelected: controller.categoryList[index]
                                        .subCategories[ind].isSelected,
                                    category: controller
                                            .categoryList[index].isSelected
                                        ? controller.categoryList[index]
                                            .subCategories[ind].category
                                        : "category",
                                    day: controller.categoryList[index]
                                        .subCategories[ind].day,
                                  ),
                                  Visibility(
                                      visible: controller.categoryList[index]
                                          .subCategories[ind].isSelected,
                                      child: ListView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount: controller
                                              .categoryList[index]
                                              .subCategories[ind]
                                              .activities
                                              .length,
                                          itemBuilder: (context, idx) {
                                            return ItemCategory(
                                              onTapMainItem: () {
                                                controller
                                                        .categoryList[index]
                                                        .subCategories[ind]
                                                        .activities[idx]
                                                        .isSelected =
                                                    !controller
                                                        .categoryList[index]
                                                        .subCategories[ind]
                                                        .activities[idx]
                                                        .isSelected;
                                                controller.categoryList
                                                    .refresh();
                                              },
                                              onCheck: () {
                                                controller
                                                        .categoryList[index]
                                                        .subCategories[ind]
                                                        .activities[idx]
                                                        .isCheck =
                                                    !controller
                                                        .categoryList[index]
                                                        .subCategories[ind]
                                                        .activities[idx]
                                                        .isCheck;
                                                controller.categoryList
                                                    .refresh();
                                              },
                                              title: controller
                                                  .categoryList[index]
                                                  .subCategories[ind]
                                                  .activities[idx]
                                                  .title,
                                              isCheck: controller
                                                  .categoryList[index]
                                                  .subCategories[ind]
                                                  .activities[idx]
                                                  .isCheck,
                                              fontWeght: FontWeight.w400,
                                              icon: controller
                                                  .categoryList[index]
                                                  .subCategories[ind]
                                                  .activities[idx]
                                                  .secondIcon,
                                              isSelected: controller
                                                  .categoryList[index]
                                                  .subCategories[ind]
                                                  .activities[idx]
                                                  .isSelected,
                                              category: controller
                                                      .categoryList[index]
                                                      .subCategories[ind]
                                                      .isSelected
                                                  ? controller
                                                      .categoryList[index]
                                                      .subCategories[ind]
                                                      .activities[idx]
                                                      .category
                                                  : "category",
                                            );
                                          }))
                                ],
                              );
                            }),
                      )
                    ],
                  );
                });
              }),
        ],
      ),
    );
  }
}
