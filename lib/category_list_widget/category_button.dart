import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton({
    super.key,
    required this.category,
    required this.isSelected,
    required this.onPressed,
  });

  final String category;
  final bool isSelected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
          category,
          style: TextStyle(
          color: isSelected ? Colors.white:Colors.black,
      ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          isSelected ? Colors.black : Colors.white70,
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
          )
        )
      ),
    );
  }
}