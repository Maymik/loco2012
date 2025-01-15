import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loco_2012/features/tournaments/cubit/tournaments_cubit.dart';
import 'package:loco_2012/features/tournaments/cubit/tournaments_state.dart';
import '../../../utils/constants.dart';
import '../../../widgets/custom_expandable_card.dart';

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
                return ExpandableCard(
                  title: tournament.name,
                  subtitle:
                      "Дата: ${tournament.date.day}.${tournament.date.month}.${tournament.date.year}\n"
                      "Місце: ${tournament.city}\n"
                      "Стадіон: ${tournament.stadium}",
                  leadingIcon:
                      const Icon(Icons.sports_soccer, color: Colors.green),
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
