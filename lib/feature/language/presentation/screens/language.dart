import 'package:flutter/material.dart';

import '../../../../config/locale/app_localizations.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/assets_manager.dart';
import '../widgets/choose_language.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  List<bool> isChecked = [];

  @override
  void initState() {
    super.initState();
  }

  List<bool> chooseLan() {
    if (AppLocalizations.of(context)!.isEnLocale) {
      setState(() {
        isChecked = [true, false, false];
      });
      return isChecked;
    } else if (AppLocalizations.of(context)!.isArLocale) {
      setState(() {
        isChecked = [false, true, false];
      });
      return isChecked;
    } else {
      setState(() {
        isChecked = [false, false, true];
      });
      return isChecked;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          AppLocalizations.of(context)!.translate(AppStrings.languageTitle)!,
          style: TextStyle(color: AppColors.black),
        ),
        iconTheme: IconThemeData(
          color: AppColors.black,
        ),
        // actions: [Image.asset(ImageAssets.logoIcon)],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 30),
        child: Column(
          children: [
            ChooseLanguageWidget(isChecked: chooseLan()),
            const SizedBox(
              height: 80,
            ),
          ],
        ),
      ),
    );
  }
}
