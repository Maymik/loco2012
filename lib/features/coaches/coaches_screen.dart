import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/coaches_model.dart';
import '../../utils/constants.dart';
import 'coaches_cubit.dart';

@RoutePage(name: 'CoachesRoute')
class CoachesScreen extends StatelessWidget {
  const CoachesScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.red,
        titleTextStyle: const TextStyle(
            color: Colors.green, fontSize: 40, fontWeight: FontWeight.w600),
        title: const Text(AppConstants.coaches,
            style: TextStyle(
                color: Colors.green,
                fontSize: 40,
                fontWeight: FontWeight.w600)),
      ),
      body: BlocBuilder<CoachesCubit, List<Coach>>(builder: (context, coaches) {
        if (coaches.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: coaches.length,
          itemBuilder: (context, index) {
            final coach = coaches[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: ListTile(
                leading: const Icon(Icons.person, color: Colors.blue),
                title: Text(coach.position,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Ім’я: ${coach.name}'),
                    Text('Інформація: ${coach.info}'),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
