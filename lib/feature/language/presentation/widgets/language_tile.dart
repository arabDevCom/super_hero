import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class LanguageTileWidget extends StatelessWidget {
  const LanguageTileWidget(
      {Key? key,
      required this.images,
      required this.titles,
      this.isChecked = false})
      : super(key: key);
  final String images;
  final String titles;
  final bool isChecked;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  images,
                  height: 34,
                  width: 36,
                ),
                const SizedBox(width: 15),
                Text(
                  titles,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          isChecked
              ? Expanded(
                  child: Icon(
                  Icons.check,
                  color: AppColors.primary,
                ))
              : const Expanded(
                  child: SizedBox(
                  width: 0,
                ))
        ],
      ),
    );
  }
}
