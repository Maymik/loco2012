import 'package:flutter/material.dart';
import 'package:loco_2012/data/news_model.dart';

class NewsDetailScreen extends StatelessWidget {
  final NewsModel news;

  const NewsDetailScreen({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: Text(
          news.news.split('.').first,
          style: const TextStyle(
            color: Colors.green,
            fontSize: 32,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (news.images.isNotEmpty)
              Center(
                child: SizedBox(
                  height: 240,
                  width: double.infinity,
                  child: Image.network(
                    news.images.first,
                    fit: BoxFit.cover,
                  ),
                ),
              )
            else
             const SizedBox.shrink(),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Text(
                news.news,
                style: const TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Автор: ${news.author}",
            ),
            Text("Час: ${news.time.hour}:${news.time.minute}"),
          ],
        ),
      ),
    );
  }
}
