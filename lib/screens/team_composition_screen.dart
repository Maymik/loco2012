import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loco_2012/screens/team_composition_cubit.dart';
import '../data/team_composition_model.dart';
import '../utils/constants.dart';

@RoutePage(name: 'TeamCompositionRoute')
class TeamCompositionScreen extends StatelessWidget {
  const TeamCompositionScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.red,
        titleTextStyle: const TextStyle(
            color: Colors.green, fontSize: 40, fontWeight: FontWeight.w600),
        title: const Text(AppConstants.teamComposition,
            style: TextStyle(
                color: Colors.green,
                fontSize: 40,
                fontWeight: FontWeight.w600)),
      ),
      body:
      BlocBuilder<TeamCompositionCubit, List<TeamPlayer>>(
        builder: (context, teamPlayers) {
      if (teamPlayers.isEmpty) {
        return const Center(child: CircularProgressIndicator());
      }
      return ListView.builder(
        itemCount: teamPlayers.length,
        itemBuilder: (context, index) {
          final teamPlayer = teamPlayers[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              leading: const Icon(Icons.person, color: Colors.blue),
              title: Text(teamPlayer.name,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Номер: ${teamPlayer.number.toString()}'),
                  // Text('Ім’я: ${teamPlayer.name}'),
                  Text('Позиція: ${teamPlayer.position}'),
                ],
              ),
            ),
          );
        },
      );} ),
    );
  }
}
