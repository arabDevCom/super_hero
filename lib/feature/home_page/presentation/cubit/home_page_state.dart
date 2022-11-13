part of 'home_page_cubit.dart';

abstract class HomePageState {}

class HomePageInitial extends HomePageState {}

class TabChanged extends HomePageState {
  final int index;

  TabChanged(this.index);
}

class OrderChanged extends HomePageState {}

