import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../config/app_theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final List<Widget>? actions;
  final Widget? leading;
  final Color? backgroundColor;
  final Color? titleColor;
  final double elevation;
  final bool centerTitle;
  final PreferredSizeWidget? bottom;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.showBackButton = true,
    this.actions,
    this.leading,
    this.backgroundColor,
    this.titleColor,
    this.elevation = 0,
    this.centerTitle = true,
    this.bottom,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(bottom == null ? 56 : 56 + bottom!.preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(
          color: titleColor ?? AppTheme.textColor,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: centerTitle,
      elevation: elevation,
      backgroundColor: backgroundColor ?? Colors.white,
      leading: showBackButton && Navigator.canPop(context)
          ? leading ?? IconButton(
              icon: const Icon(Icons.arrow_back, color: AppTheme.textColor),
              onPressed: () => Get.back(),
            )
          : leading,
      actions: actions,
      bottom: bottom,
    );
  }
}