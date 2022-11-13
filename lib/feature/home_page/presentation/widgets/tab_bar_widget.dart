import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_hero/feature/home_page/presentation/cubit/home_page_cubit.dart';

import '../../../../core/utils/app_colors.dart';

class TabBarWidget extends StatelessWidget {
  TabBarWidget({Key? key, required this.text, required this.index})
      : super(key: key);
  final String text;
  final int index;

  @override
  Widget build(BuildContext context) {
    print("qqqqqqq");
    print(index);
    return Expanded(
      child: InkWell(
        onTap: () {
          context.read<HomePageCubit>().changePage(index);
          print('5555555555555555');
          print(context.read<HomePageCubit>().page);
          print(index);
        },
        child: Container(
          height: 55,
          decoration: BoxDecoration(
              color: context.read<HomePageCubit>().page == index
                  ? AppColors.primary2
                  : null,
              borderRadius: index == 0
                  ? const BorderRadius.only(
                      bottomRight: Radius.circular(12),
                      topRight: Radius.circular(12))
                  : const BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      topLeft: Radius.circular(12))),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
