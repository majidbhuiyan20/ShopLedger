import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.appBarTitle, required this.onTap, this.icon});

  final String appBarTitle;
  final VoidCallback onTap;
  final IconData? icon;


  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primary,
      elevation: 0,
      title: Row(
        children: [
           Text(
            appBarTitle,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
          ),
          const Spacer(),
          InkWell(
            onTap:onTap,
            borderRadius: BorderRadius.circular(50),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(.15),
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white.withOpacity(.2), width: 1.5),
              ),
              child: Icon(
                icon ?? Icons.add,
                color: Colors.white,
                size: 24,
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}