import 'package:flutter/material.dart';
import 'package:seminario_2026_02/model/mock_data.dart';
import 'package:seminario_2026_02/model/routine.dart';
import 'package:seminario_2026_02/pages/routine_detail_page.dart';

class RoutineDetailScreen extends StatelessWidget {
  final Routine? routine;

  const RoutineDetailScreen({super.key, this.routine});

  @override
  Widget build(BuildContext context) {
    final currentRoutine = routine ?? initialRoutines.first;

    return Scaffold(
      appBar: AppBar(
        title: Text(currentRoutine.name),
      ),
      body: SafeArea(
        child: RoutineDetailPage(routine: currentRoutine),
      ),
    );
  }
}
