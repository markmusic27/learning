import 'package:flutter/material.dart';

import '../constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(50);
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('BMI CALCULATOR', style: kHeader1),
    );
  }
}
