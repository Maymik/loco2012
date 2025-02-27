import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loco_2012/widgets/select_field.dart';

import '../../../data/news_model.dart';
import '../../../repositories/news_repository.dart';
import '../../../utils/service_locator.dart';
import '../../../widgets/custom_text_field.dart';

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
  File? _selectedImage;

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
        _imagePreviewUrl = null;
      });
    }
  }

  void _previewImage() {
    if (Uri.tryParse(_imageUrlController.text)?.hasAbsolutePath ?? false) {
      setState(() {
        _imagePreviewUrl = _imageUrlController.text;
        _selectedImage = null;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Некорректний URL зображення')),
      );
    }
  }

  Future<void> _createNews() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() => _isLoading = true);

      String? imageUrl;
      if (_selectedImage != null) {
        imageUrl = await uploadImageToFirebase(_selectedImage!);
      } else if (_imageUrlController.text.isNotEmpty) {
        imageUrl = _imageUrlController.text;
      }

      final news = NewsModel(
        time: DateTime.now(),
        news: _newsController.text,
        author: _authorController.text,
        title: _titleController.text,
        id: '',
        images: imageUrl != null ? [imageUrl] : [],
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
            fontSize: 40,
            fontWeight: FontWeight.w600,
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
                CustomTextFieldContainer(
                  controller: _titleController,
                  labelText: 'Заголовок',
                  validator: (value) =>
                      value!.isEmpty ? 'Введіть заголовок' : null,
                ),
                const SizedBox(height: 16),
                CustomTextFieldContainer(
                  controller: _authorController,
                  labelText: 'Автор',
                  validator: (value) =>
                      value!.isEmpty ? 'Введіть автора' : null,
                ),
                const SizedBox(height: 16),
                CustomTextFieldContainer(
                  controller: _newsController,
                  labelText: 'Зміст',
                  maxLines: 3,
                  validator: (value) =>
                      value!.isEmpty ? 'Введіть текст новини' : null,
                ),
                const SizedBox(height: 16),
                CustomTextFieldContainer(
                  controller: _imageUrlController,
                  labelText: 'URL зображення',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.image_search),
                    onPressed: _previewImage,
                  ),
                  validator: (value) {
                    if (value!.isNotEmpty &&
                        !(Uri.tryParse(value)?.hasAbsolutePath ?? false)) {
                      return 'Некорректний URL';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                ElevatedButton.icon(
                  onPressed: _pickImage,
                  icon: const Icon(Icons.photo_library),
                  label: const Text("Вибрати зображення"),
                ),
                if (_selectedImage != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Image.file(_selectedImage!),
                  ),
                if (_imagePreviewUrl != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Image.network(_imagePreviewUrl!),
                  ),
                const SizedBox(height: 16),
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

Future<String?> uploadImageToFirebase(File imageFile) async {
  try {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference storageRef =
        FirebaseStorage.instance.ref().child('news_images/$fileName.jpg');
    UploadTask uploadTask = storageRef.putFile(imageFile);

    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  } catch (e) {
    print("Ошибка загрузки: $e");
    return null;
  }
}
