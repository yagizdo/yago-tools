import 'package:flutter/material.dart';
import 'package:yago_tools/constants/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      return ListView.builder(
          itemCount: data!.length,
          itemBuilder: (context, index) {

            // App Object
            AppModel app = data[index];

            // List Tile
            return ListTile(
              title: Text(app.fields!.name ?? '',style: TextStyle(color: white,fontSize: 17.sp,fontWeight: FontWeight.bold,),textAlign: TextAlign.start),
              subtitle: Text(app.fields!.description ?? '',style: TextStyle(color: white,fontSize: 13.sp),textAlign: TextAlign.start,),
            );
          });
    } else {
      return Text('State : ${snapshot.connectionState}');
    }
  }
}
