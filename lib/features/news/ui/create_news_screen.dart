import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

import '../../../widgets/custom_circular_indicator.dart';
import '../../../widgets/custom_text_field.dart';
import '../../../widgets/select_field.dart';
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

  final List<File> _selectedImages = [];
  final List<File> _selectedVideos = [];
  final List<String> _imageUrls = [];

  bool _isLoading = false;

  Future<void> _pickImagesFromGallery() async {
    final pickedFiles = await ImagePicker().pickMultiImage();
    if (pickedFiles.isNotEmpty) {
      setState(() {
        _selectedImages.addAll(pickedFiles.map((file) => File(file.path)));
      });
    }
  }

  Future<void> _pickImageFromCamera() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _selectedImages.add(File(pickedFile.path));
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

  Future<void> _pickVideoFromCamera() async {
    final pickedFile =
        await ImagePicker().pickVideo(source: ImageSource.camera);
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

  Future<void> _createNews(BuildContext context) async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() => _isLoading = true);

      await context.read<NewsCubit>().createNews(
            title: _titleController.text,
            author: _authorController.text,
            newsContent: _newsController.text,
            images: _selectedImages,
            videos: _selectedVideos,
            imageUrls: _imageUrls,
          );

      setState(() => _isLoading = false);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: const Text(
          "Нова новина",
          style: TextStyle(
              fontSize: 40, fontWeight: FontWeight.w600, color: Colors.green),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: BlocBuilder<NewsCubit, NewsState>(
        builder: (context, state) {
          return _isLoading
              ? const Center(
                  child: FootballLoadingIndicator(
                  size: 80,
                ))
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton.icon(
                                  onPressed: _pickVideoFromGallery,
                                  icon: const Icon(Icons.video_library),
                                  label: const Text("Відео з галереї")),
                              ElevatedButton.icon(
                                  onPressed: _pickVideoFromCamera,
                                  icon: const Icon(Icons.videocam),
                                  label: const Text("Записати відео")),
                            ],
                          ),
                          const SizedBox(height: 10),
                          if (_selectedImages.isNotEmpty)
                            Text(
                              'Вибрані фото ',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            ),
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
                          if (_selectedVideos.isNotEmpty)
                            Text(
                              'Вибрані відео ',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            ),
                          SizedBox(
                            height: 100,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: _selectedVideos.length,
                              itemBuilder: (context, index) {
                                return Stack(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      width: 100,
                                      height: 100,
                                      child: VideoThumbnail(
                                          _selectedVideos[index].path),
                                    ),
                                    Positioned(
                                      top: 0,
                                      child: IconButton(
                                        icon: const Icon(Icons.cancel,
                                            color: Colors.red),
                                        onPressed: () {
                                          setState(() {
                                            _selectedVideos.removeAt(index);
                                          });
                                        },
                                      ),
                                    )
                                  ],
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 10),
                          SelectField(
                            onTap: () => _createNews(context),
                            text: 'Створити новину',
                            backgroundColor: Colors.red,
                          ),
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

class VideoThumbnail extends StatefulWidget {
  final String videoPath;

  const VideoThumbnail(this.videoPath, {super.key});

  @override
  _VideoThumbnailState createState() => _VideoThumbnailState();
}

class _VideoThumbnailState extends State<VideoThumbnail> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(File(widget.videoPath))
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          )
        : Container(
            color: Colors.grey[300],
            child: const Center(child: CircularProgressIndicator()),
          );
  }
}