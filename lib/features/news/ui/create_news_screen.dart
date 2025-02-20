import 'package:flutter/material.dart';
import 'package:loco_2012/widgets/select_field.dart';

import '../../../data/news_model.dart';
import '../../../repositories/news_repository.dart';
import '../../../utils/service_locator.dart';

class CreateNewsScreen extends StatefulWidget {
  const CreateNewsScreen({super.key});

  @override
  State<CreateNewsScreen> createState() => _CreateNewsScreenState();
}

class _CreateNewsScreenState extends State<CreateNewsScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _authorController = TextEditingController();
  final TextEditingController _newsController = TextEditingController();

  bool _isLoading = false;

  void _createNews() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() => _isLoading = true);

      final news = NewsModel(
        time: DateTime.now(),
        news: _newsController.text,
        author: _authorController.text,
        title: _titleController.text,
        id: '',
        images: [],
      );

      try {
        await getIt<NewsRepository>().createNews(news);
        Navigator.pop(context);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Ошибка: ${e.toString()}')),
        );
      } finally {
        setState(() => _isLoading = false);
      }
    }
  }

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
        title: const Text(
          "Нова новина",
          style: TextStyle(
            color: Colors.green,
            fontSize: 32,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Заголовок'),
                validator: (value) =>
                    value!.isEmpty ? 'Введите заголовок' : null,
              ),
              TextFormField(
                controller: _authorController,
                decoration: const InputDecoration(labelText: 'Автор'),
                validator: (value) => value!.isEmpty ? 'Введіть автора' : null,
              ),
              TextFormField(
                controller: _newsController,
                decoration: const InputDecoration(labelText: 'Зміст'),
                maxLines: 5,
                validator: (value) =>
                    value!.isEmpty ? 'Введіть текст новости' : null,
              ),
              const SizedBox(height: 20),
              _isLoading
                  ? const CircularProgressIndicator()
                  : SelectField(
                      onTap: _createNews,
                      text: 'Створити новину',
                      backgroundColor: Colors.red),
            ],
          ),
        ),
      ),
    );
  }
}
