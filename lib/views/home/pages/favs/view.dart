import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/features/products/model.dart';

import 'package:thimar/views/home/pages/favs/states.dart';

import '../../../../core/design/app_button.dart';
import 'cubit.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("المفضلة",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.sp),),
      ),
      body: BlocBuilder<FavoriteCubit, FavoriteStates>(
        builder: (context, state) {
          if (state is GetFavoriteSuccessState) {
            return GridView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 163 / 250,
                mainAxisSpacing: 0,
                crossAxisSpacing: 16,
              ),
              itemCount: state.list.length,
              itemBuilder: (context, index) =>
                  _Item(model: state.list[index]),
            );
          } else if (state is GetFavoriteFailedState) {
            return Text("FAILED");
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({ required this.model});

  final ProductModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(17.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.08),
                  offset: const Offset(0, 2),
                  blurRadius: 11,
                )
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 8.h,
              ),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(11.r),
                  child: Stack(
                    alignment: AlignmentDirectional.topEnd,
                    children: [
                      CachedNetworkImage(
                        imageUrl: model.mainImage,
                        width: 145.w,
                        height: 117.h,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Container(
                        width: 54.w,
                        height: 19.h,
                        padding: EdgeInsets.only(top: 3.0.h),
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadiusDirectional.only(
                                bottomStart: Radius.circular(11.r))),
                        child: Center(
                          child: Text(
                            "${model.discount} %",
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "l",
                                fontWeight: FontWeight.bold,
                                fontSize: 12.sp),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(start: 9.0.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.title,
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 4.0.h),
                      child: Text(
                        "السعر / 1كجم",
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w300,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                    Text.rich(TextSpan(
                        text: "${model.price} ر.س",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                          color: Theme.of(context).primaryColor,
                        ),
                        children: [
                          const TextSpan(text: "\t"),
                          TextSpan(
                            text: "${model.priceBeforeDiscount} ر.س",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16.sp,
                              decoration: TextDecoration.lineThrough,
                              color: Theme.of(context).primaryColor,
                            ),
                          )
                        ])),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(
                          start: 24.0, end: 24, top: 10, bottom: 10),
                      child: AppButton(
                        title: "أضف للسلة",
                        width: 115.w,
                        height: 35.h,
                        radius: 9.r,
                        onPress: () {},
                        color: const Color(0xff61B80C),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
