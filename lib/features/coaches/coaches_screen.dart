import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/coaches_model.dart';
import '../../utils/constants.dart';
import 'coaches_cubit.dart';
import 'coaches_state.dart';

@RoutePage(name: 'CoachesRoute')
class CoachesScreen extends StatelessWidget {
  const CoachesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.red,
        title: const Text(
          AppConstants.coaches,
          style: TextStyle(
            color: Colors.green,
            fontSize: 40,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: BlocBuilder<CoachesCubit, CoachesState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: Text('')),
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (coaches) => ListView.builder(
              itemCount: coaches.length,
              itemBuilder: (context, index) {
                final coach = coaches[index];
                return ExpandableCoachCard(coach: coach);
              },
            ),
            error: (message) => Center(child: Text(message)),
          );
        },
      ),
    );
  }
}

class ExpandableCoachCard extends StatefulWidget {
  final Coach coach;
  const ExpandableCoachCard({super.key, required this.coach});

  @override
  State<ExpandableCoachCard> createState() => _ExpandableCoachCardState();
}

class _ExpandableCoachCardState extends State<ExpandableCoachCard> {
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
                  const Icon(Icons.person, color: Colors.blue),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      widget.coach.name,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Text(
                widget.coach.position,
                style: const TextStyle(color: Colors.grey, fontSize: 16),
              ),
              if (isExpanded) ...[
                const SizedBox(height: 8),
                Text(
                  widget.coach.info,
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

