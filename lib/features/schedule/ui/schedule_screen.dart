// import 'package:auto_route/annotations.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:loco_2012/features/schedule/cubit/schedule_cubit.dart';
// import 'package:loco_2012/features/schedule/cubit/schedule_state.dart';
// import '../../../utils/constants.dart';
// import '../../../widgets/custom_circular_indicator.dart';
// import '../../../widgets/custom_expandable_card.dart';
//
// @RoutePage(name: 'ScheduleRoute')
//
// class ScheduleScreen extends StatelessWidget {
//   const ScheduleScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.green,
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         centerTitle: true,
//         backgroundColor: Colors.red,
//         title: const Text(
//           AppConstants.schedule,
//           style: TextStyle(
//             color: Colors.green,
//             fontSize: 40,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//       ),
//       body: BlocBuilder<ScheduleCubit, ScheduleState>(
//         builder: (context, state) {
//           return state.when(
//             initial: () => const Center(child: Text('')),
//             loading: () =>  const Center(child: FootballLoadingIndicator()),
//             loaded: (scheduleList) => ListView.builder(
//               itemCount: scheduleList.length,
//               itemBuilder: (context, index) {
//                 final schedule = scheduleList[index];
//                 return ExpandableCard(
//                   title: schedule.day,
//                   subtitle:
//                       "Час: ${schedule.time}\nМісце: ${schedule.location}",
//                   leadingIcon:
//                       const Icon(Icons.calendar_today, color: Colors.green),
//                 );
//               },
//             ),
//             error: (message) => Center(child: Text(message)),
//           );
//         },
//       ),
//     );
//   }
// }
import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utils/constants.dart';
import '../../../widgets/custom_circular_indicator.dart';
import '../../../widgets/custom_expandable_card.dart';
import '../cubit/schedule_cubit.dart';
import '../cubit/schedule_state.dart';

@RoutePage(name: 'ScheduleRoute')
class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.red,
        title: const Text(
          AppConstants.schedule,
          style: TextStyle(
            color: Colors.green,
            fontSize: 40,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: BlocBuilder<ScheduleCubit, ScheduleState>(
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: state.when(
                  initial: () => const Center(child: Text('')),
                  loading: () => const Center(child: FootballLoadingIndicator()),
                  loaded: (scheduleList) => ListView.builder(
                    itemCount: scheduleList.length,
                    itemBuilder: (context, index) {
                      final schedule = scheduleList[index];
                      return ExpandableCard(
                        title: schedule.day,
                        subtitle:
                        "Час: ${schedule.time}\nМісце: ${schedule.location}",
                        leadingIcon: const Icon(
                          Icons.calendar_today,
                          color: Colors.green,
                        ),
                      );
                    },
                  ),
                  error: (message) => Center(child: Text(message)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
               child:  ElevatedButton.icon(
                  onPressed: () {
                    launchUrl(Uri.parse('https://www.instagram.com/lokomotyv.ua/'));
                  },
                  icon: const Icon(Icons.link, color: Colors.white),
                  label: const Text(
                    'Ми в Instagram',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
