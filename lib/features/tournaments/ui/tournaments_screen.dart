import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loco_2012/features/tournaments/cubit/tournaments_cubit.dart';
import 'package:loco_2012/features/tournaments/cubit/tournaments_state.dart';

import '../../../utils/constants.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/custom_circular_indicator.dart';
import '../../../widgets/custom_expandable_card.dart';

@RoutePage(name: 'TournamentsRoute')

class TournamentsScreen extends StatelessWidget {
  const TournamentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: const CustomAppBar(
        title: AppConstants.tournaments,
      ),
      body: BlocBuilder<TournamentsCubit, TournamentsState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: Text('')),
            loading: () => const Center(
                child: FootballLoadingIndicator(
              size: 80,
            )),
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
