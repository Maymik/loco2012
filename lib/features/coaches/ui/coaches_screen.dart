import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loco_2012/widgets/custom_circular_indicator.dart';

import '../../../utils/constants.dart';
import '../../../widgets/custom_app_bar.dart';
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
      appBar: const CustomAppBar(
        title: AppConstants.coaches,
      ),
      body: Column(
        children: [
          BlocBuilder<CoachesCubit, CoachesState>(
            builder: (context, state) {
              return state.when(
                initial: () => const Center(child: Text('')),
                loading: () => const Center(
                    child: FootballLoadingIndicator(
                  size: 80,
                )),
                loaded: (coaches) => Expanded(
                  child: ListView.builder(
                    itemCount: coaches.length,
                    itemBuilder: (context, index) {
                      final coach = coaches[index];
                      return ExpandableCard(
                        title: "${coach.position} - ${coach.name}",
                        subtitle: coach.info,
                        leadingIcon:
                            const Icon(Icons.person, color: Colors.blue),
                      );
                    },
                  ),
                ),
                error: (message) => Center(child: Text(message)),
              );
            },
          ),
        ],
      ),
    );
  }
}
