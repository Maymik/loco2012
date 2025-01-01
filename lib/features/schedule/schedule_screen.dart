import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loco_2012/features/schedule/schedule_cubit.dart';
import 'package:loco_2012/features/schedule/schedule_state.dart';

import '../../utils/constants.dart';

@RoutePage(name: 'ScheduleRoute')
class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.red,
        title: const Text(
          AppConstants.schedule,
          style: TextStyle(
            color: Colors.green,
            fontSize: 40,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: BlocBuilder<ScheduleCubit, ScheduleState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(
              child: Text(''),
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (scheduleList) => ListView.builder(
              itemCount: scheduleList.length,
              itemBuilder: (context, index) {
                final schedule = scheduleList[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    leading: const Icon(Icons.calendar_today, color: Colors.green),
                    title: Text(schedule.day),
                    subtitle: Text(
                        'Час: ${schedule.time}\nМісце: ${schedule.location}'),
                  ),
                );
              },
            ),
            error: (message) => Center(child: Text(message)),
          );
        },
      ),
    );
  }
}
