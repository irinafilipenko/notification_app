import 'package:get/get.dart';
import 'package:notification_app/screens/category/category_model.dart';

class CategoryTwoController extends GetxController {
  dynamic argumentData = Get.arguments;
  RxBool isCheckAll = false.obs;
  RxBool isCheckOneAll = false.obs;
  RxInt indexScreen = 0.obs;

  @override
  void onInit() {
    indexScreen.value = argumentData[0]['index'];

    super.onInit();
  }

  RxList<Category> categoryList = [
    Category(
      title: 'Sport',
      categoryOpen: "sport",
      mainIcon: '⚽',
      isSelected: false,
      isCheck: false,
      subCategories: [
        SubCategory(
          category: "onCategory",
          title: 'Morning',
          day: "day",
          middleIcon: "🐝",
          isSelected: false,
          isCheck: false,
          activities: [
            Activity(
              category: "activity",
              title: 'Biking',
              secondIcon: "⛳️",
              isSelected: false,
              isCheck: false,
            ),
            Activity(
              category: "activity",
              title: 'Running',
              secondIcon: "⛹️",
              isSelected: false,
              isCheck: false,
            ),
          ],
        ),
        SubCategory(
          category: "onCategory",
          title: 'Evening',
          day: "day",
          middleIcon: "🍕",
          isSelected: false,
          isCheck: false,
          activities: [
            Activity(
              category: "activity",
              title: 'Ping Pong',
              secondIcon: "⛹️",
              isSelected: false,
              isCheck: false,
            ),
            Activity(
              category: "activity",
              title: 'Volleyball',
              secondIcon: "⛹️",
              isSelected: false,
              isCheck: false,
            ),
          ],
        ),
        SubCategory(
          category: "onCategory",
          title: 'Boxing',
          middleIcon: '🥊',
          isSelected: false,
          isCheck: false,
          activities: [],
        ),
        SubCategory(
          category: "onCategory",
          title: 'Football',
          middleIcon: '⚽',
          isSelected: false,
          isCheck: false,
          activities: [],
        ),
      ],
    ),
    Category(
      title: 'Work',
      mainIcon: "💻",
      isSelected: false,
      isCheck: false,
      subCategories: [
        SubCategory(
          category: "onCategory",
          middleIcon: "🗓️",
          title: 'Meeting',
          isSelected: false,
          isCheck: false,
          activities: [],
        ),
        SubCategory(
          category: "onCategory",
          middleIcon: "🖨️",
          title: 'Print document',
          isSelected: false,
          isCheck: false,
          activities: [],
        ),
      ],
    ),
    Category(
      mainIcon: "🕹️",
      title: 'Alarm',
      isSelected: false,
      isCheck: false,
      subCategories: [],
    ),
    Category(
      mainIcon: "🎭",
      title: 'Party',
      isSelected: false,
      isCheck: false,
      subCategories: [],
    ),
    Category(
      mainIcon: "🥙",
      title: 'Dinner',
      isSelected: false,
      isCheck: false,
      subCategories: [],
    ),
  ].obs;

  RxList<Category> categoryOneList = [
    Category(
      title: 'Sport',
      categoryOpen: "sport",
      mainIcon: '⚽',
      isSelected: false,
      isCheck: false,
      subCategories: [
        SubCategory(
          category: "onCategory",
          isLongText: true,
          title:
              'Some very long names of action with many symbols in two, three, or four lines with text; the limit should be four lines.',
          day: "day",
          middleIcon: "🐝",
          isSelected: false,
          isCheck: false,
          activities: [
            Activity(
              category: "activity",
              title: 'Biking',
              secondIcon: "⛳️",
              isSelected: false,
              isCheck: false,
            ),
            Activity(
              category: "activity",
              title: 'Running',
              secondIcon: "⛹️",
              isSelected: false,
              isCheck: false,
            ),
          ],
        ),
        SubCategory(
          category: "onCategory",
          title: 'Evening',
          day: "day",
          middleIcon: "🍕",
          isSelected: false,
          isCheck: false,
          activities: [
            Activity(
              category: "activity",
              isLongText: true,
              title:
                  'Some very long names of action with many symbols in two, three, or four lines with text; the limit should be four lines.',
              secondIcon: "🏓️",
              isSelected: false,
              isCheck: false,
            ),
            Activity(
              category: "activity",
              title: 'Volleyball',
              secondIcon: "⛹️",
              isSelected: false,
              isCheck: false,
            ),
          ],
        ),
        SubCategory(
          category: "onCategory",
          title: 'Boxing',
          middleIcon: '🥊',
          isSelected: false,
          isCheck: false,
          activities: [],
        ),
        SubCategory(
          category: "onCategory",
          title: 'Football',
          middleIcon: '⚽',
          isSelected: false,
          isCheck: false,
          activities: [],
        ),
      ],
    ),
    Category(
      title: 'Work',
      mainIcon: "💻",
      isSelected: false,
      isCheck: false,
      subCategories: [
        SubCategory(
          category: "onCategory",
          middleIcon: "🗓️",
          title: 'Meeting',
          isSelected: false,
          isCheck: false,
          activities: [],
        ),
        SubCategory(
          category: "onCategory",
          middleIcon: "🖨️",
          title: 'Print document',
          isSelected: false,
          isCheck: false,
          activities: [],
        ),
      ],
    ),
    Category(
      mainIcon: "🕹️",
      title: 'Alarm',
      isSelected: false,
      isCheck: false,
      subCategories: [],
    ),
    Category(
      mainIcon: "🎭",
      title: 'Party',
      isSelected: false,
      isCheck: false,
      subCategories: [],
    ),
    Category(
      mainIcon: "🥙",
      title: 'Dinner',
      isSelected: false,
      isCheck: false,
      subCategories: [],
    ),
  ].obs;

  onCheckAll() {
    if (indexScreen.value == 1) {
      isCheckAll.value = !isCheckAll.value;
      if (isCheckAll.value) {
        for (var category in categoryList) {
          category.isCheck = true;
          for (var subCategory in category.subCategories) {
            subCategory.isCheck = true;
            for (var activity in subCategory.activities) {
              activity.isCheck = true;
            }
          }
        }
      } else {
        for (var category in categoryList) {
          category.isCheck = false;
          for (var subCategory in category.subCategories) {
            subCategory.isCheck = false;
            for (var activity in subCategory.activities) {
              activity.isCheck = false;
            }
          }
        }
      }
      categoryList.refresh();
    } else {
      isCheckOneAll.value = !isCheckOneAll.value;
      if (isCheckOneAll.value) {
        for (var category in categoryOneList) {
          category.isCheck = true;
          for (var subCategory in category.subCategories) {
            subCategory.isCheck = true;
            for (var activity in subCategory.activities) {
              activity.isCheck = true;
            }
          }
        }
      } else {
        for (var category in categoryOneList) {
          category.isCheck = false;
          for (var subCategory in category.subCategories) {
            subCategory.isCheck = false;
            for (var activity in subCategory.activities) {
              activity.isCheck = false;
            }
          }
        }
      }
      categoryOneList.refresh();
    }
  }
}
