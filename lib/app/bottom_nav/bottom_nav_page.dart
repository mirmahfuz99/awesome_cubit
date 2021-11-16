import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/bottom_nav_cubit.dart';

class BottomNavPage extends StatelessWidget {
  const BottomNavPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNavigationBar(context),
      body: Center(
        child: _bottomNavigationView(),
      ),
    );
  }
  ///build_bottom_nav_bar
  Widget _bottomNavigationBar(BuildContext context) {
    return Container(
      height: 56,
      color: Colors.grey.shade200,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _bottomNavigationBarItem(
            label: 'First',
            iconData: Icons.looks_one,
            bnbItem: BnbItem.first,
          ),
          _bottomNavigationBarItem(
            label: 'Second',
            iconData: Icons.looks_two,
            bnbItem: BnbItem.second,
          ),
          _bottomNavigationBarItem(
            label: 'Third',
            iconData: Icons.looks_3,
            bnbItem: BnbItem.third,
          ),

        ],
      ),
    );
  }
  ///build_bottom_nav_bar_item
  _bottomNavigationBarItem({
    required String label,
    required  IconData iconData,
    required BnbItem bnbItem,
  }) {
    return BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
        builder: (context, state) {
          if (state is BottomNavBarInitial) {
            return GestureDetector(
              onTap: () {
                context.read<BottomNavBarCubit>().onBottomNavItemTapped(bnbItem);
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Icon(iconData, color:state.item != bnbItem? Colors.black:Colors.green,)
                  ),
                  Text(label)
                ],
              ),
            );
          } else {
            return const SizedBox();
          }
        });
  }

  ///build_view_based_on_state
  Widget _bottomNavigationView() {
    return BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
      builder: (context, state) {
        if (state is BottomNavBarInitial) {
          switch (state.item) {
            case BnbItem.first:
              return const Text("First Screen !");
            case BnbItem.second:
              return const Text("Second Screen !");
            case BnbItem.third:
              return const Text("Third Screen !");
          }
        }
        return const SizedBox();
      },
    );
  }
}
