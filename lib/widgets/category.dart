import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  const Category({
    super.key,
    required this.category,
    required this.ispush,
  });

  final String category;
  final bool ispush;

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  late bool ispush;

  @override
  void initState() {
    super.initState();
    ispush = widget.ispush;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton.icon(
        onPressed: () {
          setState(() {
            ispush = !ispush;
          });
        },
        label: Text(widget.category),
      ),
    );
  }
}