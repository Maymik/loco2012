import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loco_2012/features/tournaments/cubit/tournaments_cubit.dart';
import 'package:loco_2012/features/tournaments/cubit/tournaments_state.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../utils/constants.dart';
import '../../../widgets/custom_circular_indicator.dart';
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
      body: BlocBuilder<TournamentsCubit, TournamentsState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: Text('')),
            loading: () =>  const Center(child: FootballLoadingIndicator()),
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
