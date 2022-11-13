import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_hero/injector.dart'
as injector;

import 'app.dart';
import 'app_bloc_observer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injector.setup();
  BlocOverrides.runZoned(
        () => runApp(const SuperSales()),
    blocObserver: AppBlocObserver(),
  );
}
