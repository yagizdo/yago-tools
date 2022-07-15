import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors.dart';
import '../models/app_model.dart';

class AppCard extends StatelessWidget {
  AppCard({Key? key,required this.app}) : super(key: key);
  AppModel app;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(7.w),
      // Grid Box
      child: Container(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10.w,right: 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // Sizedbox for top padding
                  SizedBox(height: 10.h,),

                  // App Logo and App Name
                  Row(
                    children: [
                      Image.network(app.fields!.images![0].thumbnails!.small!.url!),
                      SizedBox(width: 5.w,),
                      Text(app.fields!.name!,style: const TextStyle(color: black,fontWeight: FontWeight.bold),),
                    ],
                  ),

                  // Sizedbox for top padding
                  SizedBox(height: 5.h),

                  // Premium - Free Tag
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 2.h,horizontal: 5.w),
                    child: Text(app.fields!.tags![0],style: TextStyle(color: white),),
                    decoration: BoxDecoration(
                      color: app.fields!.tags![0]! == 'Free' ? Colors.green : Colors.red,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),

                  // Sizedbox for padding
                  SizedBox(height: 10.h,),

                  // Rating
                  RatingBar.builder(
                      itemCount: 5,
                      itemSize: 20,
                      initialRating: app.fields!.rating!.toDouble(),
                      direction: Axis.horizontal,
                      itemBuilder: (context,_) => const Icon(Icons.star,color: Colors.amber,),
                      onRatingUpdate: (rating) {

                      }
                  ),

                  // Sizedbox for padding
                  SizedBox(height: 10.h,),

                  // Tags
                  SizedBox(
                    height: 20.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: app.fields?.category?.length ?? 0,
                      itemBuilder: (context,index) {
                        return Padding(
                          padding: EdgeInsets.only(right: 5.w),
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 2.h,horizontal: 5.w),
                            child: Text(app.fields!.category![index],style: const TextStyle(color: black),),
                            decoration: BoxDecoration(
                              color: app.fields!.category![index]! == 'work' ? const Color(0xFFCFDEFF) : const Color(0xFFD0F7C3),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        );
                      },
                    ),
                  )

                ],
              ),
            ),

            // Go detail page
            Positioned(
                top: 120.h,
                left: 120.w,
                child: Container(
                  decoration: const BoxDecoration(
                      color: black,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(150),bottomLeft: Radius.circular(50))
                  ),
                  height: 70.h,
                  width: 0.2.sw,
                  child: Padding(
                    padding: EdgeInsets.only(right: 15.w),
                    child: Icon(Icons.arrow_forward_rounded,color: white,size: 25.sp,),
                  ),
                ))
          ],
        ),
        decoration: BoxDecoration(
          color: const Color(0xFFECFDF5),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
