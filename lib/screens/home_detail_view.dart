import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:yago_tools/models/app_model.dart';

class HomeDetailView extends StatelessWidget {
  HomeDetailView({Key? key, required this.app}) : super(key: key);
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
            child: CachedNetworkImage(
              memCacheHeight: 150,
                useOldImageOnUrlChange: true,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                imageUrl: app.fields?.images?[0].thumbnails?.large?.url ?? ''),
          ),
        ],
      ),
    );
  }
}
