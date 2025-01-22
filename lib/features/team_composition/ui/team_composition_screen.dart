import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loco_2012/features/team_composition/cubit/team_composition_cubit.dart';
import 'package:loco_2012/features/team_composition/cubit/team_composition_state.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utils/constants.dart';
import '../../../widgets/custom_circular_indicator.dart';

@RoutePage(name: 'TeamCompositionRoute')
class TeamCompositionScreen extends StatelessWidget {
  const TeamCompositionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.red,
        titleTextStyle: const TextStyle(
          color: Colors.green,
          fontSize: 40,
          fontWeight: FontWeight.w600,
        ),
        title: const Text(
          AppConstants.teamComposition,
          style: TextStyle(
            color: Colors.green,
            fontSize: 40,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'Instagram') {
                launchUrl(Uri.parse('https://www.instagram.com/lokomotyv.ua/'));
              } else if (value == 'Facebook') {
                launchUrl(Uri.parse('https://www.facebook.com/lokomotyv2012/'));
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'Instagram',
                child: Text('Ми в Instagram'),
              ),
              const PopupMenuItem(
                value: 'Facebook',
                child: Text('Ми в Facebook'),
              ),
            ],
          ),
        ],
      ),
      body: BlocBuilder<TeamCompositionCubit, TeamCompositionState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(
              child: Text(''),
            ),
            loading: () =>  const Center(child: FootballLoadingIndicator()),
            loaded: (teamPlayers) => ListView.builder(
              itemCount: teamPlayers.length,
              itemBuilder: (context, index) {
                final player = teamPlayers[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    leading: const Icon(Icons.person, color: Colors.blue),
                    title: Text(player.name,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
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
    );
  }
}
