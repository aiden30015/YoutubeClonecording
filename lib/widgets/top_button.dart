import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopButton extends StatelessWidget {
  const TopButton({
    super.key,
    required this.icon,
    required this.widget
  });

  final IconData icon;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Flexible(
        flex: 1,
        child: IconButton(
          onPressed: () {
            Navigator.push(
                context,
              MaterialPageRoute(builder: (context) => widget)
            );
          }, icon: Icon(icon,size: 32,),
        )
    );
  }
}
