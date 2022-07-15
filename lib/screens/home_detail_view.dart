import 'package:flutter/material.dart';
import 'package:yago_tools/models/app_model.dart';

class HomeDetailView extends StatelessWidget {
  HomeDetailView({Key? key,required this.app}) : super(key: key);
  AppModel app;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(app.fields?.name ?? 'No Name'),
      ),
      body: Column(
        children: [
          Hero(
              tag: app,
              child: Image.network(app.fields?.images?[0].thumbnails?.large?.url ?? '')),
          Text(''),
        ],
      ),
    );
  }
}
