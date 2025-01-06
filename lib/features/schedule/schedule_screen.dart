import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loco_2012/features/schedule/schedule_cubit.dart';
import 'package:loco_2012/features/schedule/schedule_state.dart';

import '../../data/schedule_model.dart';
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
                return ExpandableScheduleCard(schedule: schedule);
              },
            ),
            error: (message) => Center(child: Text(message)),
          );
        },
      ),
    );
  }
}

class ExpandableScheduleCard extends StatefulWidget {
  final Schedule schedule;
  const ExpandableScheduleCard({super.key, required this.schedule});

  @override
  State<ExpandableScheduleCard> createState() => _ExpandableScheduleCardState();
}

class _ExpandableScheduleCardState extends State<ExpandableScheduleCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: InkWell(
        onTap: () {
          setState(() {
            isExpanded = !isExpanded;
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.calendar_today, color: Colors.green),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      widget.schedule.day,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
              if (isExpanded) ...[
                const SizedBox(height: 8),
                Text(
                  'Час: ${widget.schedule.time}',
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  'Місце: ${widget.schedule.location}',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
