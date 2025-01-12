import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../utils/constants.dart';
import 'news_cubit.dart';
import 'news_state.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.red,
        title: const Text(
          AppConstants.news,
          style: TextStyle(
            color: Colors.green,
            fontSize: 40,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: BlocBuilder<NewsCubit, NewsState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: Text('')),
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (newsList) => ListView.builder(
              itemCount: newsList.length,
              itemBuilder: (context, index) {
                final news = newsList[index];
                 return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    leading: const Icon(Icons.person, color: Colors.blue),
                    title: Text(news.news.split('.').first,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle:
                        Text( "${news.news}\n\nАвтор: ${news.author}\n${news.time.hour}:${news.time.minute}",),
                  ),
                );
                //   ExpandableCard(
                //   title: news.news.split('.').first,
                //   subtitle:
                //       "${news.news}\n\nАвтор: ${news.author}\n${news.time.hour}:${news.time.minute}",
                //   leadingIcon:
                //       const Icon(Icons.newspaper_rounded, color: Colors.green),
                // );
              },
            ),
            error: (message) => Center(child: Text(message)),
          );
        },
      ),
    );
  }
}
