import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:loco_2012/data/news_model.dart';

@RoutePage()
class NewsDetailScreen extends StatelessWidget {
  final NewsModel news;

  const NewsDetailScreen({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(news.news.split('.').first),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.popRoute(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child:
        Image.network(
          'https://s.ill.in.ua/i/news/630x373/545/545795.jpg',
          height: 200,
          fit: BoxFit.cover,
        ),
            ),
            const SizedBox(height: 16),
            Text(
              news.news,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
             Text(
              "Автор: ${news.author}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
             Text("Время: ${news.time.hour}:${news.time.minute}"),
          ],
        ),
      ),
    );
  }
}