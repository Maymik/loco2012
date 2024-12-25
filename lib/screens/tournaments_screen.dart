import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../data/tournaments_model.dart';
import '../utils/constants.dart';

@RoutePage(name: 'TournamentsRoute')
class TournamentsScreen extends StatefulWidget {
  const TournamentsScreen({
    super.key,
  });

  @override
  State<TournamentsScreen> createState() => _TournamentsScreenState();
}

class _TournamentsScreenState extends State<TournamentsScreen> {
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
        title: const Text(
          AppConstants.tournaments,
          style: TextStyle(
              color: Colors.green, fontSize: 40, fontWeight: FontWeight.w600),
        ),
      ),
      body: ListView.builder(
        itemCount: tournaments.length,
        itemBuilder: (context, index) {
          final tournament = tournaments[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              leading: const Icon(Icons.sports_soccer, color: Colors.green),
              title: Text(tournament.name),
              subtitle: Text(
                'Дата: ${tournament.date.day}.${tournament.date.month}.${tournament.date.year}\n'
                'Місто: ${tournament.city}\n'
                'Стадіон: ${tournament.stadium}',
              ),
            ),
          );
        },
      ),
    );
  }
}
