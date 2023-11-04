import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:thimar/core/logic/helper_methods.dart';
import 'package:thimar/views/show_product_details/view.dart';

import '../../../../core/design/app_button.dart';
import '../../../../core/design/app_input.dart';
import '../../../../features/category/cubit/cubit.dart';
import '../../../../features/category/cubit/states.dart';
import '../../../../features/category/model.dart';
import '../../../../features/products/bloc/cubit.dart';
import '../../../../features/products/bloc/states.dart';
import '../../../../features/products/model.dart';
import '../../../../features/slider/bloc/cubit.dart';
import '../../../../features/slider/bloc/states.dart';
import '../../../auth/login/states.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 21.h),
              child: AppInput(
                image: "assets/images/search.png",
                labelText: "ابحث عن ماتريد؟",
                prefixColor: const Color(0xffB9C9A8),
                fillColor: Theme.of(context).primaryColor.withOpacity(.03),
              ),
            ),
            BlocBuilder<SliderCubit, SliderStates>(builder: (context, state) {
              if (state is LoginLoadingState) {
                return const CircularProgressIndicator();
              } else if (state is SliderSuccessState) {
                return Column(
                  children: [
                    CarouselSlider(
                        options: CarouselOptions(
                            viewportFraction: 1,
                            initialPage: 3,
                            autoPlay: true,
                            onPageChanged: (index, reason) {
                              currentIndex = index;
                              setState(() {});
                            },
                            autoPlayAnimationDuration:
                                const Duration(seconds: 3, milliseconds: 500)),
                        items: List.generate(
                          state.list.length,
                          (index) => CachedNetworkImage(
                            width: double.infinity,
                            fit: BoxFit.fill,
                            imageUrl: state.list[index].media,
                            placeholder: (context, url) => Container(
                              height: 164,
                              color: Colors.grey.withOpacity(.04),
                            ),
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: SizedBox(
                        height: 20,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ...List.generate(
                                state.list.length,
                                (index) => Padding(
                                      padding: const EdgeInsets.only(left: 5.0),
                                      child: CircleAvatar(
                                          radius: 3.5,
                                          backgroundColor: index == currentIndex
                                              ? Theme.of(context).primaryColor
                                              : const Color(0xffB9C9A8)),
                                    ))
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return const Text("Failed");
              }
            }),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  const Text(
                    "الأقسام",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const Spacer(),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        "عرض الكل",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                        ),
                      ))
                ],
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            BlocBuilder<CategoriesCubit, CategoriesStates>(
                builder: (context, state) {
              if (state is CategoriesSuccessState) {
                return SizedBox(
                  height: 109,
                  child: ListView.separated(
                    padding:
                        const EdgeInsetsDirectional.only(start: 16, end: 16),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) =>
                        _ItemCategory(model: state.list[index]),
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 16,
                    ),
                    itemCount: state.list.length,
                  ),
                );
              } else if (state is CategoriesLoadingState) {
                return const SizedBox(
                  height: 109,
                  child: Center(child: CircularProgressIndicator()),
                );
              } else {
                return const Text("Failed");
              }
            }),
            SizedBox(height: 22.h),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    textAlign: TextAlign.start,
                    "الأصناف",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  BlocBuilder<ProductCubit, ProductStates>(
                      builder: (context, state) {
                    if (state is ProductLoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is ProductSuccessState) {
                      return GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 163 / 250,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                        ),
                        itemCount: state.list.length,
                        itemBuilder: (context, index) =>
                            _ProductItem(model: state.list[index]),
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProductItem extends StatelessWidget {
  final ProductModel model;

  const _ProductItem({required this.model});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigateTo(ProductDetailsView(id: model.id));
        // ProductDetailsCubit();
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
            SizedBox(height: 8.h,),
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
                    SizedBox(height: 20.h,),
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
      ),
    );
  }
}

class _ItemCategory extends StatelessWidget {
  final CategoryModel model;

  const _ItemCategory({required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 76,
          height: 76,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11),
              boxShadow: [
                BoxShadow(
                    color: const Color(0xff707070).withOpacity(.03),
                    offset: const Offset(0, 3),
                    blurRadius: 6)
              ]),
          child: Center(
            child: Image.network(
              model.media,
              height: 60,
              width: 60,
            ),
          ),
        ),
        SizedBox(
          height: 26,
          child: Text(
            model.name,
            style: const TextStyle(
              color: Color(0xff3E3E3E),
              fontWeight: FontWeight.w500,
              fontSize: 19,
            ),
          ),
        )
      ],
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: 60.h,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/logo.png",
                width: 23,
                height: 23,
              ),
              const SizedBox(
                width: 3,
              ),
              Text(
                "سلة ثمار",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Theme.of(context).primaryColor),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width / 9.6),
                  child: Text.rich(
                    textAlign: TextAlign.center,
                    TextSpan(
                        text: "التوصيل إلى\n",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).primaryColor),
                        children: const [
                          TextSpan(
                              text: "شارع الملك فهد - جدة",
                              style: TextStyle(fontWeight: FontWeight.w500))
                        ]),
                  ),
                ),
              ),
              Badge(
                alignment: AlignmentDirectional.topStart,
                offset: const Offset(4, -5.5),
                backgroundColor: Theme.of(context).primaryColor,
                label: const Text(
                  "3",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: const Color(0xff4C8613).withOpacity(.2),
                  ),
                  child: SvgPicture.asset(
                    "assets/icons/svg/bag.svg",
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60);
}
