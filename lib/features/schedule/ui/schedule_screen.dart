import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/constants.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/custom_circular_indicator.dart';
import '../../../widgets/custom_expandable_card.dart';
import '../cubit/schedule_cubit.dart';
import '../cubit/schedule_state.dart';

@RoutePage(name: 'ScheduleRoute')
class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: const CustomAppBar(
        title: AppConstants.schedule,
      ),
      body: BlocBuilder<ScheduleCubit, ScheduleState>(
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: state.when(
                  initial: () => const Center(child: Text('')),
                  loading: () => const Center(
                      child: FootballLoadingIndicator(
                    size: 80,
                  )),
                  loaded: (scheduleList) => ListView.builder(
                    itemCount: scheduleList.length,
                    itemBuilder: (context, index) {
                      final schedule = scheduleList[index];
                      return ExpandableCard(
                        title: schedule.day,
                        subtitle:
                        "Час: ${schedule.time}\nМісце: ${schedule.location}",
                        leadingIcon: const Icon(
                          Icons.calendar_today,
                          color: Colors.green,
                        ),
                      );
                    },
                  ),
                  error: (message) => Center(child: Text(message)),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
