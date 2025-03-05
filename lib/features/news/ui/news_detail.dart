import 'package:auto_route/annotations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/custom_circular_indicator.dart';
import '../cubit/news_detail_cubit.dart';
import '../cubit/news_state.dart';

@RoutePage(name: 'NewsDetailRoute')
class NewsDetailScreen extends StatelessWidget {
  final String newsId;

  const NewsDetailScreen({super.key, required this.newsId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsDetailCubit()..fetchNewsById(newsId),
      child: Scaffold(
        backgroundColor: Colors.green,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          leading: IconButton(
            color: Colors.green,
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
          backgroundColor: Colors.red,
          title: const Text(
            "Деталі новини",
            style: TextStyle(
              color: Colors.green,
              fontSize: 40,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: BlocBuilder<NewsDetailCubit, NewsState>(
          builder: (context, state) {
            return state.when(
              initial: () => const Center(child: SizedBox.shrink()),
              loading: () => const Center(child: FootballLoadingIndicator()),
              loaded: (newsList) {
                final news = newsList.first;
                return SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (news.images.isNotEmpty)
                        SizedBox(
                          height: 200,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: news.images.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: CachedNetworkImage(
                                    imageUrl: news.images[index],
                                    width: 380,
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) => const Center(
                                      child: FootballLoadingIndicator(),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error,
                                            size: 50, color: Colors.red),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      const SizedBox(height: 16),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 8),
                        child: Text(
                          news.news,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text("Автор: ${news.author}"),
                      Text("Час: ${news.time.hour}:${news.time.minute}"),
                    ],
                  ),
                );
              },
              error: (message) => Center(child: Text(message)),
            );
          },
        ),
      ),
    );
  }
}
