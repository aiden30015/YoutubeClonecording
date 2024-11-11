import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({super.key, required this.icon, required this.text, required this.push});

  final IconData icon;
  final String text;
  final Function push;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: IconButton(
            onPressed: () => push,
            icon: Icon(icon),
          ),
        ),
        Expanded(
            flex: 1,
            child: Text(
              text
            )
        ),
      ],
    );
  }
}
