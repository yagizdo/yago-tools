import 'package:flutter/material.dart';
import 'package:yago_tools/constants/app_colors.dart';
import 'package:yago_tools/widgets/app_card.dart';

import '../models/app_model.dart';

class AppList extends StatelessWidget {
  AppList({Key? key, required this.snapshot}) : super(key: key);
  var snapshot;

  @override
  Widget build(BuildContext context) {

    // Connection state of the future builder check
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(
        child: CircularProgressIndicator(),
      );

      // Snapshot error check
    } else if (snapshot.hasError) {
      return const Center(
        child: Text('Error : snapshot.error', style: TextStyle(color: white)),
      );

      // Snapshot data check
    } else if (snapshot.hasData) {
      var data = snapshot!.data;

      // Post List
      return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: data!.length,
          itemBuilder: (context, index) {

            // App Object
            AppModel app = data[index];

            // App Card
            return AppCard(app: app);
          });
    } else {
      return Text('State : ${snapshot.connectionState}');
    }
  }
}
