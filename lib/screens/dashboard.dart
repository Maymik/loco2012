import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../navigation/app_router.gr.dart';
import '../widgets/select_field.dart';

@RoutePage()
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({
    super.key,
  });

  static const routeName = 'DashboardScreenRoute';

  static Page<dynamic> page() => const MaterialPage<void>(
        name: routeName,
        key: ValueKey(routeName),
        child: DashboardScreen(),
      );

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red,
        titleTextStyle: const TextStyle(
          color: Colors.green,
          fontSize: 40,
          fontWeight: FontWeight.w600,
        ),
        title: const Text("Loko2012"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SelectField(
              onTap: () {
                context.router.push(const NewsRoute());
              },
              text: "Останні новини",
              backgroundColor: Colors.green,
            ),
            const SizedBox(height: 54),
            SelectField(
              onTap: () {
                context.router.push(const ScheduleRoute());
              },
              text: "Розклад на тиждень",
              backgroundColor: Colors.green,
            ),
            const SizedBox(height: 54),
            SelectField(
              onTap: () {
                context.router.push(const TeamCompositionRoute());
              },
              text: "Склади команд",
              backgroundColor: Colors.green,
            ),
            const SizedBox(height: 54),
            SelectField(
              onTap: () {
                context.router.push(const CoachesRoute());
              },
              text: "Тренери",
              backgroundColor: Colors.green,
            ),
            const SizedBox(height: 54),
            SelectField(
              onTap: () {
                context.router.push(const TournamentsRoute());
              },
              text: "Наступні турніри",
              backgroundColor: Colors.green,
            ),
            const SizedBox(height: 54),
            SelectField(
              onTap: () {
                context.router.push(const UsefulLinksRoute());
              },
              text: "Корисні посилання",
              backgroundColor: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
