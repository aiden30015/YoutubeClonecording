import 'package:flutter/cupertino.dart';
import 'package:youtubeclonecording/widgets/category_button.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  final Set<String> selectedCategories = {};

  void toggleCategory(String category) {
    setState(() {
      if (selectedCategories.contains(category)) {
        selectedCategories.remove(category);
      } else {
        selectedCategories.add(category);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final categories = [
      "전체", "게임", "음악", "라이브", "뉴스", "요리", "최근에 업로드된 영상", "감상한 동영상", "새로운 맞춤 동영상"
    ];

    return ListView(
      scrollDirection: Axis.horizontal,
      children: categories.map((category) {
        final isSelected = selectedCategories.contains(category);
        return CategoryButton(
          category: category,
          isSelected: isSelected,
          onPressed: () => toggleCategory(category),
        );
      }).toList(),
    );
  }
}