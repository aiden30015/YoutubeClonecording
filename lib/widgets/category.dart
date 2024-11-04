import 'package:flutter/cupertino.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    return ListWheelScrollView(
        itemExtent: itemExtent, children: children
    );
  }
}
