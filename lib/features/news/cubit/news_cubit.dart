import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/news_model.dart';
import '../../../repositories/news_repository.dart';
import '../../../utils/service_locator.dart';
import 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  final NewsRepository _newsRepository = getIt<NewsRepository>();

  NewsCubit() : super(const NewsState.initial()) {
    subscribeToNews();
  }

  void subscribeToNews() {
    emit(const NewsState.loading());

    try {
      _newsRepository.getNews().listen(
            (newsList) {
          emit(NewsState.loaded(newsList));
        },
        onError: (e, stackTrace) {
          emit(NewsState.error('Помилка завантаження: $e\n$stackTrace'));
        },
      );
    } catch (e, stackTrace) {
      emit(NewsState.error('Критична помилка: $e\n$stackTrace'));
    }
  }

  Future<String?> _uploadImage(File imageFile) async {
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

  Future<String?> _uploadVideo(File videoFile) async {
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

  Future<void> createNews({
    required String title,
    required String author,
    required String newsContent,
    required List<File> images,
    required List<File> videos,
    required List<String> imageUrls,
  }) async {
    emit(const NewsState.loading());

    try {
      List<String> uploadedImages = [];
      for (var image in images) {
        final url = await _uploadImage(image);
        if (url != null) uploadedImages.add(url);
      }

      List<String> uploadedVideos = [];
      for (var video in videos) {
        final url = await _uploadVideo(video);
        if (url != null) uploadedVideos.add(url);
      }

      final news = NewsModel(
        time: DateTime.now(),
        title: title,
        author: author,
        news: newsContent,
        id: '',
        images: [...imageUrls, ...uploadedImages],
        videos: uploadedVideos,
      );

      await _newsRepository.createNews(news);
      emit(const NewsState.initial());
    } catch (e) {
      emit(NewsState.error('Помилка створення новини: $e'));
    }
  }
}
