import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);
}
