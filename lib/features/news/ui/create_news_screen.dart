import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loco_2012/widgets/select_field.dart';

import '../../../data/news_model.dart';
import '../../../widgets/custom_circular_indicator.dart';
import '../../../widgets/custom_text_field.dart';
import '../cubit/news_cubit.dart';
import '../cubit/news_state.dart';

class CreateNewsScreen extends StatelessWidget {
  const CreateNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit(),
      child: const CreateNewsView(),
    );
  }
}

class CreateNewsView extends StatefulWidget {
  const CreateNewsView({super.key});

  @override
  State<CreateNewsView> createState() => _CreateNewsViewState();
}

class _CreateNewsViewState extends State<CreateNewsView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _authorController = TextEditingController();
  final TextEditingController _newsController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();

  List<File> _selectedImages = [];
  List<File> _selectedVideos = [];
  List<String> _imageUrls = [];
  List<String> _videoUrls = [];

  bool _isLoading = false;

  Future<void> _pickImageFromCamera() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _selectedImages.add(File(pickedFile.path));
      });
    }
  }

  Future<void> _pickImagesFromGallery() async {
    final pickedFiles = await ImagePicker().pickMultiImage();
    if (pickedFiles.isNotEmpty) {
      setState(() {
        _selectedImages.addAll(pickedFiles.map((file) => File(file.path)));
      });
    }
  }

  Future<void> _pickVideoFromCamera() async {
    final pickedFile =
        await ImagePicker().pickVideo(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _selectedVideos.add(File(pickedFile.path));
      });
    }
  }

  Future<void> _pickVideoFromGallery() async {
    final pickedFile =
        await ImagePicker().pickVideo(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedVideos.add(File(pickedFile.path));
      });
    }
  }

  void _addImageUrl() {
    final url = _imageUrlController.text.trim();
    if (Uri.tryParse(url)?.hasAbsolutePath ?? false) {
      setState(() {
        _imageUrls.add(url);
        _imageUrlController.clear();
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Некорректний URL зображення')),
      );
    }
  }

  Future<List<String>> _uploadImages() async {
    List<String> uploadedUrls = [];
    for (var image in _selectedImages) {
      final url = await uploadImageToFirebase(image);
      if (url != null) {
        uploadedUrls.add(url);
      }
    }
    return uploadedUrls;
  }

  Future<List<String>> _uploadVideos() async {
    List<String> uploadedUrls = [];
    for (var video in _selectedVideos) {
      final url = await uploadVideoToFirebase(video);
      if (url != null) {
        uploadedUrls.add(url);
      }
    }
    return uploadedUrls;
  }

  Future<void> _createNews(BuildContext context) async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() => _isLoading = true);

      List<String> uploadedImages = await _uploadImages();
      List<String> uploadedVideos = await _uploadVideos();

      final news = NewsModel(
        time: DateTime.now(),
        news: _newsController.text,
        author: _authorController.text,
        title: _titleController.text,
        id: '',
        images: [..._imageUrls, ...uploadedImages],
        videos: uploadedVideos,
      );

      await context.read<NewsCubit>().createNews(news);
      setState(() => _isLoading = false);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: const Text("Нова новина",
            style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w600,
                color: Colors.green)),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: BlocBuilder<NewsCubit, NewsState>(
        builder: (context, state) {
          return _isLoading
              ? const Center(child: FootballLoadingIndicator())
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          CustomTextFieldContainer(
                              controller: _titleController,
                            labelText: 'Заголовок',
                            validator: (value) => value == null || value.isEmpty
                                ? 'Поле не може бути пустим'
                                : null,
                          ),
                          const SizedBox(height: 16),
                          CustomTextFieldContainer(
                              controller: _authorController,
                            labelText: 'Автор',
                            validator: (value) => value == null || value.isEmpty
                                ? 'Поле не може бути пустим'
                                : null,
                          ),
                          const SizedBox(height: 16),
                          CustomTextFieldContainer(
                              controller: _newsController,
                              labelText: 'Зміст',
                            maxLines: 5,
                            validator: (value) => value == null || value.isEmpty
                                ? 'Поле не може бути пустим'
                                : null,
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: CustomTextFieldContainer(
                                  controller: _imageUrlController,
                                  labelText: 'URL зображення',
                                ),
                              ),
                              IconButton(
                                  icon: const Icon(Icons.add),
                                  onPressed: _addImageUrl),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton.icon(
                                  onPressed: _pickImagesFromGallery,
                                  icon: const Icon(Icons.photo_library),
                                  label: const Text("Галерея")),
                              ElevatedButton.icon(
                                  onPressed: _pickImageFromCamera,
                                  icon: const Icon(Icons.camera_alt),
                                  label: const Text("Камера")),
                            ],
                          ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                          //   children: [
                          //     ElevatedButton.icon(
                          //         onPressed: _pickVideoFromGallery,
                          //         icon: const Icon(Icons.video_library),
                          //         label: const Text("Відео з галереї")),
                          //     ElevatedButton.icon(
                          //         onPressed: _pickVideoFromCamera,
                          //         icon: const Icon(Icons.videocam),
                          //         label: const Text("Записати відео")),
                          //   ],
                          // ),
                          const SizedBox(height: 10),
                          if (_selectedImages.isNotEmpty)
                            SizedBox(
                              height: 100,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: _selectedImages.length,
                                itemBuilder: (context, index) {
                                  return Stack(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        width: 100,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          image: DecorationImage(
                                            image: FileImage(
                                                _selectedImages[index]),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 0,
                                        child: IconButton(
                                          icon: const Icon(Icons.cancel,
                                              color: Colors.red),
                                          onPressed: () {
                                            setState(() {
                                              _selectedImages.removeAt(index);
                                            });
                                          },
                                        ),
                                      )
                                    ],
                                  );
                                },
                              ),
                            ),
                          const SizedBox(
                            height: 10,
                          ),
                          SelectField(
                              onTap: () => _createNews(context),
                              text: 'Створити новину',
                              backgroundColor: Colors.red),
                        ],
                      ),
                    ),
                  ),
                );
        },
      ),
    );
  }
}

Future<String?> uploadImageToFirebase(File imageFile) async {
  try {
    String fileName = "image_${DateTime.now().millisecondsSinceEpoch}.jpg";
    Reference storageRef =
        FirebaseStorage.instance.ref().child('news_images/$fileName');
    UploadTask uploadTask = storageRef.putFile(imageFile);

    TaskSnapshot snapshot = await uploadTask;
    return await snapshot.ref.getDownloadURL();
  } catch (e) {
    print("Ошибка загрузки изображения: $e");
    return null;
  }
}

Future<String?> uploadVideoToFirebase(File videoFile) async {
  try {
    String fileName = "video_${DateTime.now().millisecondsSinceEpoch}.mp4";
    Reference storageRef =
        FirebaseStorage.instance.ref().child('news_videos/$fileName');
    UploadTask uploadTask = storageRef.putFile(videoFile);

    TaskSnapshot snapshot = await uploadTask;
    return await snapshot.ref.getDownloadURL();
  } catch (e) {
    print("Ошибка загрузки видео: $e");
    return null;
  }
}
