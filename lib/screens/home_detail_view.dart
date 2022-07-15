import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yago_tools/models/app_model.dart';

import '../constants/app_colors.dart';

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
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            child: Hero(
              tag: app,
              child: CachedNetworkImage(
                  memCacheHeight: 150,
                  useOldImageOnUrlChange: true,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  imageUrl:
                      app.fields?.images?[0].thumbnails?.large?.url ?? ''),
            ),
          ),

          // Sizedbox for padding
          SizedBox(
            height: 10.h,
          ),

          Padding(
            padding: EdgeInsets.only(left: 25.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [


                // Premium - Free Tag
                Container(
                  padding:
                  EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
                  child: Text(
                    app.fields!.tags![0],
                    style: TextStyle(color: white,fontSize: 17.sp),
                  ),
                  decoration: BoxDecoration(
                    color: app.fields!.tags![0]! == 'Free'
                        ? Colors.green
                        : Colors.red,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),

                // Sizedbox for padding
                SizedBox(
                  height: 20.h,
                ),

                // Tags
                SizedBox(
                  height: 25.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: app.fields?.category?.length ?? 0,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(right: 5.w),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 5.h, horizontal: 10.w),
                          child: Text(
                            app.fields!.category![index],
                            style: const TextStyle(color: black),
                          ),
                          decoration: BoxDecoration(
                            color: app.fields!.category![index]! == 'work'
                                ? const Color(0xFFCFDEFF)
                                : const Color(0xFFD0F7C3),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                // Sizedbox for padding
                SizedBox(
                  height: 30.h,
                ),

                // App Rating
                RatingBar.builder(
                    unratedColor: white,
                    itemCount: 5,
                    ignoreGestures: true,
                    itemSize: 30,
                    initialRating: app.fields!.rating!.toDouble(),
                    direction: Axis.horizontal,
                    itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                    onRatingUpdate: (rating) {},),

                // Sizedbox for padding
                SizedBox(
                  height: 40.h,
                ),

                // Description
                Text('Description',style: TextStyle(color: white, fontSize: 26.sp,fontWeight: FontWeight.bold),),
                // Sizedbox for padding
                SizedBox(
                  height: 20.h,
                ),
                Text(app.fields?.description ?? '',style: TextStyle(color: white, fontSize: 16.sp),),

                // Sizedbox for padding
                SizedBox(
                  height: 40.h,
                ),

                // Comment
                Text('Comment',style: TextStyle(color: white, fontSize: 26.sp,fontWeight: FontWeight.bold),),
                // Sizedbox for padding
                SizedBox(
                  height: 10.h,
                ),
                Text(app.fields?.comment ?? '',style: TextStyle(color: white, fontSize: 16.sp),),


              ],
            ),
          ),

          // Sizedbox for padding
          SizedBox(
            height: 10.h,
          ),
        ],
      ),
    );
  }
}
