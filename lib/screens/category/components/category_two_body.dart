import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:notification_app/constants.dart';
import 'package:notification_app/screens/category/category_controller.dart';
import 'package:notification_app/screens/category/components/item_category.dart';

class CategoryTwoBody extends GetView<CategoryTwoController> {
  const CategoryTwoBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            height: 56,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1,
                  color: const Color(0xFFF3F3F4),
                ),
              ),
            ),
            width: double.infinity,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "All Trigers",
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: kAppBarColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
                Obx(() {
                  return GestureDetector(
                      onTap: () {
                        controller.onCheckAll();
                      },
                      child: SvgPicture.asset(controller.isCheckOneAll.value
                          ? "assets/icons/checkbox.svg"
                          : 'assets/icons/checkbox_empty.svg'));
                }),
              ],
            ),
          ),
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.categoryOneList.length,
              itemBuilder: (context, index) {
                return Obx(() {
                  return Column(
                    children: [
                      ItemCategory(
                        onTapMainItem: () {
                          controller.categoryOneList[index].isSelected =
                              !controller.categoryOneList[index].isSelected;

                          controller.categoryOneList.refresh();
                        },
                        onCheck: () {
                          controller.categoryOneList[index].isCheck =
                              !controller.categoryOneList[index].isCheck;
                          controller.categoryOneList.refresh();
                        },
                        categoryOpen:
                            controller.categoryOneList[index].isSelected
                                ? "sport"
                                : "all",
                        title: controller.categoryOneList[index].title,
                        isCheck: controller.categoryOneList[index].isCheck,
                        icon: controller.categoryOneList[index].mainIcon,
                        isSelected:
                            controller.categoryOneList[index].isSelected,
                      ),
                      Visibility(
                        visible: controller.categoryOneList[index].isSelected,
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller
                                .categoryOneList[index].subCategories.length,
                            itemBuilder: (context, ind) {
                              return Column(
                                children: [
                                  ItemCategory(
                                    onTapMainItem: () {
                                      controller.categoryOneList[index]
                                              .subCategories[ind].isSelected =
                                          !controller.categoryOneList[index]
                                              .subCategories[ind].isSelected;

                                      print(controller.categoryOneList[index]
                                          .subCategories[ind].categoryOpen);

                                      controller.categoryOneList.refresh();
                                    },
                                    categoryOpenSub: controller
                                            .categoryOneList[index]
                                            .subCategories[ind]
                                            .isSelected
                                        ? "sub"
                                        : "all",
                                    isLongText: controller
                                        .categoryOneList[index]
                                        .subCategories[ind]
                                        .isLongText,
                                    onCheck: () {
                                      controller.categoryOneList[index]
                                              .subCategories[ind].isCheck =
                                          !controller.categoryOneList[index]
                                              .subCategories[ind].isCheck;
                                      controller.categoryOneList.refresh();
                                    },
                                    title: controller.categoryOneList[index]
                                        .subCategories[ind].title,
                                    isCheck: controller.categoryOneList[index]
                                        .subCategories[ind].isCheck,
                                    fontWeght: controller.categoryOneList[index]
                                                .subCategories[ind].day ==
                                            "day"
                                        ? FontWeight.w700
                                        : FontWeight.w400,
                                    icon: controller.categoryOneList[index]
                                        .subCategories[ind].middleIcon,
                                    isSelected: controller
                                        .categoryOneList[index]
                                        .subCategories[ind]
                                        .isSelected,
                                    category: controller
                                            .categoryOneList[index].isSelected
                                        ? controller.categoryOneList[index]
                                            .subCategories[ind].category
                                        : "category",
                                    day: controller.categoryOneList[index]
                                        .subCategories[ind].day,
                                  ),
                                  Visibility(
                                      visible: controller.categoryOneList[index]
                                          .subCategories[ind].isSelected,
                                      child: ListView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount: controller
                                              .categoryOneList[index]
                                              .subCategories[ind]
                                              .activities
                                              .length,
                                          itemBuilder: (context, idx) {
                                            return ItemCategory(
                                              onTapMainItem: () {
                                                controller
                                                        .categoryOneList[index]
                                                        .subCategories[ind]
                                                        .activities[idx]
                                                        .isSelected =
                                                    !controller
                                                        .categoryOneList[index]
                                                        .subCategories[ind]
                                                        .activities[idx]
                                                        .isSelected;
                                                controller.categoryOneList
                                                    .refresh();
                                              },
                                              onCheck: () {
                                                controller
                                                        .categoryOneList[index]
                                                        .subCategories[ind]
                                                        .activities[idx]
                                                        .isCheck =
                                                    !controller
                                                        .categoryOneList[index]
                                                        .subCategories[ind]
                                                        .activities[idx]
                                                        .isCheck;
                                                controller.categoryOneList
                                                    .refresh();
                                              },
                                              isLongText: controller
                                                  .categoryOneList[index]
                                                  .subCategories[ind]
                                                  .activities[idx]
                                                  .isLongText,
                                              title: controller
                                                  .categoryOneList[index]
                                                  .subCategories[ind]
                                                  .activities[idx]
                                                  .title,
                                              isCheck: controller
                                                  .categoryOneList[index]
                                                  .subCategories[ind]
                                                  .activities[idx]
                                                  .isCheck,
                                              fontWeght: FontWeight.w400,
                                              icon: controller
                                                  .categoryOneList[index]
                                                  .subCategories[ind]
                                                  .activities[idx]
                                                  .secondIcon,
                                              isSelected: controller
                                                  .categoryOneList[index]
                                                  .subCategories[ind]
                                                  .activities[idx]
                                                  .isSelected,
                                              category: controller
                                                      .categoryOneList[index]
                                                      .subCategories[ind]
                                                      .isSelected
                                                  ? controller
                                                      .categoryOneList[index]
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
