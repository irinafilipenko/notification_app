class Category {
  String title;
  String mainIcon;
  bool isSelected;
  bool isCheck;
  List<SubCategory> subCategories;

  Category({
    required this.title,
    required this.mainIcon,
    this.isSelected = false,
    required this.isCheck,
    this.subCategories = const [],
  });
}

class SubCategory {
  String category;
  String day;
  String title;
  String middleIcon;
  bool isSelected;
  bool isCheck;
  List<Activity> activities;

  SubCategory({
    required this.title,
    required this.category,
    required this.middleIcon,
    this.day = '',
    this.isSelected = false,
    required this.isCheck,
    this.activities = const [],
  });
}

class Activity {
  String category;
  String title;
  String secondIcon;
  bool isSelected;
  bool isCheck;

  Activity({
    required this.category,
    required this.title,
    required this.secondIcon,
    this.isSelected = false,
    required this.isCheck,
  });
}
