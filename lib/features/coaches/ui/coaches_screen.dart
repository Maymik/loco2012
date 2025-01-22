import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loco_2012/widgets/custom_circular_indicator.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../utils/constants.dart';
import '../../../widgets/custom_expandable_card.dart';
import '../cubit/coaches_cubit.dart';
import '../cubit/coaches_state.dart';

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
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'Instagram') {
                launchUrl(Uri.parse('https://www.instagram.com/lokomotyv.ua/'));
              } else if (value == 'Facebook') {
                launchUrl(Uri.parse('https://www.facebook.com/lokomotyv2012.ua/'));
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'Instagram',
                child: Text('Ми в Instagram'),
              ),
              const PopupMenuItem(
                value: 'Ми в Facebook',
                child: Text('Facebook'),
              ),
            ],
          ),
        ],
      ),
      body: BlocBuilder<CoachesCubit, CoachesState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: Text('')),
            loading: () =>  const Center(child: FootballLoadingIndicator()),
            loaded: (coaches) => ListView.builder(
              itemCount: coaches.length,
              itemBuilder: (context, index) {
                final coach = coaches[index];
                return ExpandableCard(
                  title: "${coach.position} - ${coach.name}",
                  subtitle: coach.info,
                  leadingIcon: const Icon(Icons.person, color: Colors.blue),
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
