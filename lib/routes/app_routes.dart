import 'package:flutter/material.dart';
import 'package:seminario_2026_02/screens/create_routine_screen.dart';
import 'package:seminario_2026_02/screens/login_screen.dart';
import 'package:seminario_2026_02/screens/main_screen.dart';
import 'package:seminario_2026_02/screens/routine_detail_screen.dart';
import 'package:seminario_2026_02/screens/routines_screen.dart';

class AppRoutes {
  static const String login = '/';
  static const String main = '/main';
  static const String routines = '/routines';
  static const String routineDetail = '/routine-detail';
  static const String createRoutine = '/create-routine';

  static Map<String, WidgetBuilder> get routes => {
    login: (context) => const LoginScreen(),
    main: (context) => const MainScreen(),
    routines: (context) => const RoutinesScreen(),
    routineDetail: (context) => const RoutineDetailScreen(),
    createRoutine: (context) => const CreateRoutineScreen(),
  };
}
