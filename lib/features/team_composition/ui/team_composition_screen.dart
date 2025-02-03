import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loco_2012/features/team_composition/cubit/team_composition_cubit.dart';
import 'package:loco_2012/features/team_composition/cubit/team_composition_state.dart';

import '../../../utils/constants.dart';
import '../../../utils/notification_service.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/custom_circular_indicator.dart';

@RoutePage(name: 'TeamCompositionRoute')
class TeamCompositionScreen extends StatelessWidget {
  const TeamCompositionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: const CustomAppBar(
        title: AppConstants.teamComposition,
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<TeamCompositionCubit, TeamCompositionState>(
              builder: (context, state) {
                return state.when(
                  initial: () => const Center(
                    child: Text(''),
                  ),
                  loading: () =>
                      const Center(child: FootballLoadingIndicator()),
                  loaded: (teamPlayers) => ListView.builder(
                    itemCount: teamPlayers.length,
                    itemBuilder: (context, index) {
                      final player = teamPlayers[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        child: ListTile(
                          leading: const Icon(Icons.person, color: Colors.blue),
                          title: Text(player.name,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Номер: ${player.number}'),
                              Text('Позиція: ${player.position}'),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  error: (message) => Center(child: Text(message)),
                );
              },
            ),
          ),
          FloatingActionButton(
            onPressed: () {
              NotificationService().showNotification();
            },
            child: const Icon(Icons.notifications),
          )
        ],
      ),
    );
  }
}
