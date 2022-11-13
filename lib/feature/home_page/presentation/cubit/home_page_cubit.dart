import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:super_hero/core/utils/app_colors.dart';

import '../../../../core/helper/location_helper.dart';
import '../../../../core/utils/snackbar_method.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit() : super(HomePageInitial());
  int page = 0;
  String text = 'Start';

  changeText(String text){
    this.text=text;
    emit(OrderChanged());
  }

  changePage(int index) {
    page = index;
    print("paaaaaaaggggggggeeee");
    print(page);
    emit(TabChanged(index));
  }
}
