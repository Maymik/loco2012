import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loco_2012/features/tournaments/tournaments_cubit.dart';
import 'package:loco_2012/features/tournaments/tournaments_state.dart';

import '../../data/tournaments_model.dart';
import '../../utils/constants.dart';

@RoutePage(name: 'TournamentsRoute')
class TournamentsScreen extends StatelessWidget {
  const TournamentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.red,
        title: const Text(
          AppConstants.tournaments,
          style: TextStyle(
            color: Colors.green,
            fontSize: 40,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: BlocBuilder<TournamentsCubit, TournamentsState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: Text('')),
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (tournaments) => ListView.builder(
              itemCount: tournaments.length,
              itemBuilder: (context, index) {
                final tournament = tournaments[index];
                return ExpandableTournamentCard(tournament: tournament);
              },
            ),
            error: (message) => Center(child: Text(message)),
          );
        },
      ),
    );
  }
}

class ExpandableTournamentCard extends StatefulWidget {
  final Tournament tournament;
  const ExpandableTournamentCard({super.key, required this.tournament});

  @override
  State<ExpandableTournamentCard> createState() => _ExpandableTournamentCardState();
}

class _ExpandableTournamentCardState extends State<ExpandableTournamentCard> {
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
                  const Icon(Icons.sports_soccer, color: Colors.green),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      widget.tournament.name,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              if (isExpanded) ...[
                const SizedBox(height: 8),
                Text(
                  'Дата: ${widget.tournament.date.day}.${widget.tournament.date.month}.${widget.tournament.date.year}',
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  'Место: ${widget.tournament.city}',
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  'Стадіон: ${widget.tournament.stadium}',
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
