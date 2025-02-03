import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loco_2012/widgets/custom_circular_indicator.dart';

import '../../../data/news_model.dart';
import '../../../utils/constants.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/custom_expandable_card.dart';
import '../../news/cubit/news_cubit.dart';
import '../../news/cubit/news_state.dart';
import '../../news/ui/news_detail.dart';
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
                loading: () => const Center(child: FootballLoadingIndicator()),
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
          BlocBuilder<NewsCubit, NewsState>(builder: (context, state) {
            return state.when(
                initial: () => const Center(child: Text('')),
                loading: () => const Center(child: FootballLoadingIndicator()),
                loaded: (newsList) => FloatingActionButton(
                      onPressed: () {
                        print("Карточка нажата");
                        final news = NewsModel(
                          title: newsList.first.title,
                          news: newsList.first.news,
                          author: newsList.first.author,
                          time: DateTime.now(),
                          images: newsList.first.images,
                          id: newsList.first.id,
                        );

                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => NewsDetailScreen(news: news),
                          ),
                        );
                      },
                      child: const Icon(Icons.arrow_forward),
                    ),
                error: (message) => Center(child: Text(message)));
          })
        ],
      ),
    );
  }
}
