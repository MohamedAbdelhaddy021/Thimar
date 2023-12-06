import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thimar/core/logic/helper_methods.dart';
import 'package:thimar/features/category/model.dart';
import 'package:thimar/features/products/model.dart';
import 'package:thimar/views/category/cubit.dart';
import 'package:thimar/views/category/states.dart';
import 'package:thimar/views/show_product_details/view.dart';

import '../../core/design/app_button.dart';
import '../show_product_details/cubit.dart';

class CategoryView extends StatelessWidget {
  CategoryView({super.key, required this.model});

  final CategoryModel model;
  RangeValues sliderInitialValues = RangeValues(20, 600);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            width: 200,
            height: 32,
            padding: EdgeInsetsDirectional.only(
              start: 8,
            ),
            margin: EdgeInsets.all(8),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11),
              color: Theme.of(context).primaryColor.withOpacity(0.13),
            ),
            child: Center(
              child: Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ),
        title: Text(
          model.name,
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Builder(builder: (context) {
          CategoryCubit cubit = BlocProvider.of(context);
          return Column(
            children: [
              SizedBox(
                height: 60.h,
                child: TextFormField(
                  onTapOutside: (val) {
                    FocusManager.instance.primaryFocus!.unfocus();
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      prefixIcon: SvgPicture.asset(
                        "assets/icons/svg/search.svg",
                        fit: BoxFit.scaleDown,
                        color: Color(0xffB9C9A8),
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            backgroundColor: Colors.transparent,
                            builder: (context) => Container(
                              // height: MediaQuery.of(context).size.height / 3,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadiusDirectional.only(topStart: Radius.circular(40),topEnd: Radius.circular(40))
                              ),
                              padding: EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional.center,
                                    child: Text(
                                      "تصفية",
                                      style: TextStyle(
                                        fontSize: 17.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  ),
                                  Divider(),
                                  SizedBox(height: 10,),
                                  Text(
                                    "السعر",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.sp,
                                    ),
                                  ),
                                  StatefulBuilder(
                                    builder: (context, setState) => SizedBox(height: 70,
                                      child: SliderTheme(
                                        data: SliderThemeData(
                                          thumbColor: Colors.white,
                                          overlayColor: Colors.transparent,
                                          valueIndicatorTextStyle: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w400,color: Colors.black,),
                                          showValueIndicator: ShowValueIndicator.always,valueIndicatorColor: Colors.transparent
                                        ),
                                        child: RangeSlider(
                                          values: sliderInitialValues,
                                          labels: RangeLabels(
                                              "${sliderInitialValues.start.round()}  ر.س","${sliderInitialValues.end.round()}  ر.س "),
                                          onChanged: (value) {
                                            sliderInitialValues = value;
                                            setState(() {});
                                          },
                                          min: 0,
                                          max: 5000,

                                        ),
                                      ),
                                    ),
                                  ),
                                  Divider(),
                              Text(
                                "الترتيب",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),),
                                  SizedBox(height: 10,),
                                  Row(
                                    children: [
                                      Checkbox(value: true, onChanged: (value){
                                      }), Text("من السعر الأقل للأعلي",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),)
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Checkbox(value: false, onChanged: (value){
                                      }), Text("من السعر الأقل للأعلي",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),)
                                    ],
                                  ),
                                  SizedBox(width: double.infinity,child: AppButton(title: "تطبيق", onPress: (){}))
                                ],
                              ),
                            ),
                          );
                        },
                        child: Container(
                            width: 40,
                            height: 40,
                            margin: EdgeInsetsDirectional.only(
                                top: 11, end: 9, bottom: 4),
                            decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(11.0)),
                            child: SvgPicture.asset(
                              "assets/icons/svg/setting.svg",
                              fit: BoxFit.scaleDown,
                              width: 20,
                              height: 14,
                            )),
                      ),
                      fillColor:
                          Theme.of(context).primaryColor.withOpacity(0.05),
                      labelText: "Search"),
                ),
              ),
              SizedBox(
                height: 21,
              ),
              BlocBuilder(
                bloc: cubit,
                builder: (context, state) {
                  if (state is CategorySuccessState) {
                    return Expanded(
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 163 / 250,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                        ),
                        itemCount: state.list.length,
                        itemBuilder: (context, index) =>
                            _Item(model: state.list[index]),
                      ),
                    );
                  } else if (state is CategoryFailedState) {
                    return Text("FAILED");
                  } else {
                    return Expanded(child: Center(child: CircularProgressIndicator()));
                  }
                },
              ),
            ],
          );
        }),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({super.key, required this.model});

  final ProductModel model;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        ProductDetailsCubit cubit =BlocProvider.of(context);
        return GestureDetector(
          onTap: (){
            // cubit.getData(model.id);
            navigateTo(ProductDetailsView(id: model.id,isFav: model.isFavorite,));
          },
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(17.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.1),
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
          ),
        );
      }
    );
  }
}
