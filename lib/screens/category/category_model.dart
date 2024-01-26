class Category {
  String title;
  String categoryOpen;
  String mainIcon;
  bool isSelected;
  bool isCheck;
  List<SubCategory> subCategories;

  Category({
    required this.title,
    required this.mainIcon,
    this.categoryOpen = "all",
    this.isSelected = false,
    required this.isCheck,
    this.subCategories = const [],
  });
}

class SubCategory {
  String category;
  String categoryOpen;
  String day;
  String title;
  String middleIcon;
  bool isSelected;
  bool isCheck;
  bool isLongText;
  List<Activity> activities;

  SubCategory({
    required this.title,
    required this.category,
    this.categoryOpen = "all",
    required this.middleIcon,
    this.day = '',
    this.isLongText = false,
    this.isSelected = false,
    required this.isCheck,
    this.activities = const [],
  });
}

class Activity {
  String category;
  String title;
  String secondIcon;
  bool isLongText;
  bool isSelected;
  bool isCheck;

  Activity({
    required this.category,
    required this.title,
    required this.secondIcon,
    this.isSelected = false,
    this.isLongText = false,
    required this.isCheck,
  });
}
