import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
part 'bottom_nav_state.dart';

enum BnbItem { first, second, third}

class BottomNavBarCubit extends Cubit<BottomNavBarState> {
  BottomNavBarCubit() : super(BottomNavBarInitial(item: BnbItem.first));
  void onBottomNavItemTapped(BnbItem bnbItem) => emit(BottomNavBarInitial(item: bnbItem));
}