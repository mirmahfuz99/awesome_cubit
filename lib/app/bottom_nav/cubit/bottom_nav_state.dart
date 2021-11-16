part of 'bottom_nav_cubit.dart';

@immutable
abstract class BottomNavBarState {}
class BottomNavBarInitial extends BottomNavBarState {
  final BnbItem item;

  BottomNavBarInitial({required this.item});
}