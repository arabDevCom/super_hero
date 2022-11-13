import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/locale/app_localizations.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/assets_manager.dart';
import '../cubit/locale_cubit.dart';
import 'language_tile.dart';

class ChooseLanguageWidget extends StatefulWidget {
  const ChooseLanguageWidget({Key? key, required this.isChecked}) : super(key: key);
  final List<bool> isChecked;
  @override
  State<ChooseLanguageWidget> createState() => _ChooseLanguageWidgetState();
}

class _ChooseLanguageWidgetState extends State<ChooseLanguageWidget> {
  List<String> images = [
    // (ImageAssets.englishLanguageImage),
    // (ImageAssets.iraqLanguageImage),
  ];
  @override
  Widget build(BuildContext context) {
    List<String> titles = [
      AppLocalizations.of(context)!
          .translate(AppStrings.englishLanguage)!,
      AppLocalizations.of(context)!
          .translate(AppStrings.arabicLanguage)!,
    ];
    return Column(
      children: [
        ...List.generate(3, (index) {
          return InkWell(
            onTap: () {
              if (index == 0) {
                context.read<LocaleCubit>().toEnglish();
              } else if (index == 1) {
                context.read<LocaleCubit>().toArabic();
              }
            },
            child: LanguageTileWidget(
                images: images[index],
                titles: titles[index],
                isChecked: widget.isChecked[index]),
          );
        })
      ],
    );
  }
}
