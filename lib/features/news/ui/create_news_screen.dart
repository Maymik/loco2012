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
  final TextEditingController _imageUrlController = TextEditingController();

  bool _isLoading = false;
  String? _imagePreviewUrl;

  void _createNews() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() => _isLoading = true);

      final news = NewsModel(
        time: DateTime.now(),
        news: _newsController.text,
        author: _authorController.text,
        title: _titleController.text,
        id: '',
        images: _imageUrlController.text.isNotEmpty
            ? [_imageUrlController.text]
            : [],
      );

      try {
        await getIt<NewsRepository>().createNews(news);
        Navigator.pop(context);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Помилка: ${e.toString()}')),
        );
      } finally {
        setState(() => _isLoading = false);
      }
    }
  }

  void _previewImage() {
    if (Uri.tryParse(_imageUrlController.text)?.hasAbsolutePath ?? false) {
      setState(() => _imagePreviewUrl = _imageUrlController.text);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Некорректний URL зображення')),
      );
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: _titleController,
                  decoration: const InputDecoration(labelText: 'Заголовок'),
                  validator: (value) =>
                      value!.isEmpty ? 'Введіть заголовок' : null,
                ),
                TextFormField(
                  controller: _authorController,
                  decoration: const InputDecoration(labelText: 'Автор'),
                  validator: (value) =>
                      value!.isEmpty ? 'Введіть автора' : null,
                ),
                TextFormField(
                  controller: _newsController,
                  decoration: const InputDecoration(labelText: 'Зміст'),
                  maxLines: 5,
                  validator: (value) =>
                      value!.isEmpty ? 'Введіть текст новини' : null,
                ),
                TextFormField(
                  controller: _imageUrlController,
                  decoration: InputDecoration(
                    labelText: 'URL зображення',
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.image_search),
                      onPressed: _previewImage,
                    ),
                  ),
                  validator: (value) {
                    if (value!.isNotEmpty &&
                        !(Uri.tryParse(value)?.hasAbsolutePath ?? false)) {
                      return 'Некорректний URL';
                    }
                    return null;
                  },
                ),
                if (_imagePreviewUrl != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Image.network(_imagePreviewUrl!),
                  ),
                const SizedBox(height: 20),
                _isLoading
                    ? const CircularProgressIndicator()
                    : SelectField(
                        onTap: _createNews,
                        text: 'Створити новину',
                        backgroundColor: Colors.red,
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
