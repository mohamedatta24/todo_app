  import 'package:flutter/material.dart';
import 'package:todo_app/core/theme/app_colors.dart';

AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      leading: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: IconButton(
          color: AppColors.textColor,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, size: 28.0),
        ),
      ),
    );
  }