import 'package:awesome_cubit/app/bottom_nav/bottom_nav_page.dart';
import 'package:awesome_cubit/app/bottom_nav/cubit/bottom_nav_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  static const String initialRoute = '/';
  const AppRouter._();

  ///onGenerateRoute
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case initialRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
              create: (_) => BottomNavBarCubit(),
              child: const BottomNavPage()),
        );
      default:
        throw const RouteException('Route not found!');
    }
  }
}
class RouteException implements Exception {
  final String message;
  const RouteException(this.message);
}
