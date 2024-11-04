import 'dart:ffi';

import 'package:flutter/cupertino.dart';

class Myprofile extends StatelessWidget {
  const Myprofile({super.key, required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Icon(
      CupertinoIcons.profile_circled,
      size: size,
    );//Image.asset();
  }
}
