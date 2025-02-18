import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loco_2012/utils/firebase_messaging_service.dart';
import 'package:loco_2012/utils/notification_service.dart';
import 'package:loco_2012/utils/service_locator.dart';

import 'features/coaches/cubit/coaches_cubit.dart';
import 'features/news/cubit/news_cubit.dart';
import 'features/phone_auth/cubit/phone_auth_cubit.dart';
import 'features/schedule/cubit/schedule_cubit.dart';
import 'features/team_composition/cubit/team_composition_cubit.dart';
import 'features/tournaments/cubit/tournaments_cubit.dart';
import 'firebase_options.dart';
import 'navigation/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  setupLocator();

  final appRouter = AppRouter();
  PushNotificationService().init(appRouter);
  NotificationService().init(appRouter);
  runApp(MyApp(appRouter: appRouter));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  const MyApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => PhoneAuthCubit()),
        BlocProvider(
            create: (_) => TournamentsCubit()..subscribeToTournaments()),
        BlocProvider(create: (_) => NewsCubit()..subscribeToNews()),
        BlocProvider(create: (_) => CoachesCubit()..subscribeCoaches()),
        BlocProvider(
            create: (_) => TeamCompositionCubit()..subscribeTeamComposition()),
        BlocProvider(create: (_) => ScheduleCubit()..subscribeToSchedule()),
      ],
      child: MaterialApp.router(
        title: 'Loko2012',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routerConfig: appRouter.config(),
      ),
    );
  }
}
