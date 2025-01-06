import 'package:flutter/material.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/news_model.dart';
import '../../utils/constants.dart';
import 'news_cubit.dart';
import 'news_state.dart';

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
            initial: () => const Center(
              child: Text(''),
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (newsList) => ListView.builder(
              itemCount: newsList.length,
              itemBuilder: (context, index) {
                final news = newsList[index];
                return ExpandableNewsCard(news: news);
              },
            ),
            error: (message) => Center(child: Text(message)),
          );
        },
      ),
    );
  }
}

class ExpandableNewsCard extends StatefulWidget {
  final NewsModel news;
  const ExpandableNewsCard({super.key, required this.news});

  @override
  State<ExpandableNewsCard> createState() => _ExpandableNewsCardState();
}

class _ExpandableNewsCardState extends State<ExpandableNewsCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    String firstSentence = widget.news.news.split('.').first;

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: InkWell(
        onTap: () {
          setState(() {
            isExpanded = !isExpanded;
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.newspaper_rounded, color: Colors.green),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      isExpanded ? widget.news.news : "$firstSentence...",
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              if (isExpanded) ...[
                const SizedBox(height: 8),
                Text(
                  "Автор: ${widget.news.author}",
                  style: const TextStyle(color: Colors.grey),
                ),
                Text(
                  "${widget.news.time.hour}:${widget.news.time.minute}",
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

