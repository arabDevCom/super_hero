import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_hero/feature/home_page/presentation/cubit/home_page_cubit.dart';

import 'config/locale/app_localizations_setup.dart';
import 'config/routes/app_routes.dart';
import 'config/themes/app_theme.dart';
import 'core/utils/app_strings.dart';

import 'package:super_hero/injector.dart'
as injector;

import 'feature/language/presentation/cubit/locale_cubit.dart';

class SuperSales extends StatelessWidget {
  const SuperSales({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
          injector.serviceLocator<LocaleCubit>()..getSavedLanguage(),
        ),
        BlocProvider(
          create: (_) =>
          injector.serviceLocator<HomePageCubit>(),
        ),

      ],
      child: BlocBuilder<LocaleCubit, LocaleState>(
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: AppStrings.appName,
            locale: state.locale,
            theme: appTheme(),
            onGenerateRoute: AppRoutes.onGenerateRoute,
            supportedLocales: AppLocalizationsSetup.supportedLocales,
            localeResolutionCallback:
            AppLocalizationsSetup.localeResolutionCallback,
            localizationsDelegates:
            AppLocalizationsSetup.localizationsDelegates,
          );
        },
      ),
    );
  }
}