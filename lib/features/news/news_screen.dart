import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/news_model.dart';
import '../../utils/constants.dart';
import 'news_cubit.dart';

@RoutePage(name: 'NewsRoute')
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
        titleTextStyle: const TextStyle(
          color: Colors.green,
          fontSize: 40,
          fontWeight: FontWeight.w600,
        ),
        title: const Text(
          AppConstants.news,
          style: TextStyle(
            color: Colors.green,
            fontSize: 40,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body:
          BlocBuilder<NewsCubit, List<NewsModel>>(builder: (context, newsList) {
        if (newsList.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: newsList.length,
          itemBuilder: (context, index) {
            final news = newsList[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: ListTile(
                title: Text(news.news),
                subtitle: Text("Автор: ${news.author}"),
                trailing: Text(
                  "${news.time.hour}:${news.time.minute}",
                  style: const TextStyle(color: Colors.grey),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
