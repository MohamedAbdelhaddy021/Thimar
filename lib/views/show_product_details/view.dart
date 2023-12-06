import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thimar/core/design/custom_icon_filled_button.dart';
import 'package:thimar/features/products/bloc/cubit.dart';
import 'package:thimar/features/products/bloc/states.dart';
import 'package:thimar/features/products/model.dart';
import 'package:thimar/views/show_product_details/states.dart';

import '../../core/logic/helper_methods.dart';
import '../cart/cubit.dart';
import '../cart/states.dart';
import '../home/pages/favs/cubit.dart';
import '../sheets/add_to_cart.dart';
import 'cubit.dart';

class ProductDetailsView extends StatefulWidget {
   ProductDetailsView({
    super.key,
    required this.id,
     required this.isFav,
  });

  final int id;
  late bool isFav;

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {

  int amount = 1;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductDetailsCubit()..getData(widget.id),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ControlButtonItem(
              width: 32.h,
              height: 32.h,
              onTap: () {
                Navigator.pop(context);
              },
              icon: CupertinoIcons.back,
              iconColor: Theme
                  .of(context)
                  .primaryColor
                  .withOpacity(.80),
              iconSize: 22,
              color: Theme
                  .of(context)
                  .primaryColor
                  .withOpacity(.13),
            ),
          ),
          actions: [
            Builder(builder: (context) {
              FavoriteCubit favCubit = BlocProvider.of(context);
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: StatefulBuilder(
                  builder: (context, setState) {
                    return ControlButtonItem(
                      onTap: () {
                        widget.isFav?favCubit.removeItem(id: widget.id):favCubit.addToFavorite(widget.id);
                        widget.isFav=!widget.isFav;
                        setState(() {});
                      },
                      width: 32.h,
                      height: 32.h,
                      icon: widget.isFav? Icons.favorite : Icons.favorite_border,
                      iconColor:
                      widget.isFav ? Colors.red : Theme
                          .of(context)
                          .primaryColor,
                      iconSize: 22,
                      color: widget.isFav
                          ? Colors.red.withOpacity(.14)
                          : Theme
                          .of(context)
                          .primaryColor
                          .withOpacity(.13),
                    );
                  },
                ),
              );
            }),
          ],
        ),
        body: Builder(
          builder: (context) {
            ProductDetailsCubit cubit=BlocProvider.of(context);
            return BlocBuilder(
              bloc: cubit,
              builder: (context, state) {
                if (state is ProductFailedState) {
                  return const Center(
                    child: Text("FAILED"),
                  );
                } else if (state is ProductGetSuccessState) {
                  return Column(
                    children: [
                      Expanded(
                        child: ListView(
                          physics: const BouncingScrollPhysics(),
                          padding: EdgeInsetsDirectional.only(start: 16, end: 17),
                          children: [
                            Container(
                              height: 322,
                              alignment: Alignment.topCenter,
                              // padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
                              child: ClipRRect(
                                borderRadius: BorderRadiusDirectional.only(
                                    bottomStart: Radius.circular(50),
                                    bottomEnd: Radius.circular(50),
                                    topEnd: Radius.circular(25),
                                    topStart: Radius.circular(25)),
                                child: CachedNetworkImage(
                                  imageUrl: cubit.model.mainImage,
                                  height:
                                  MediaQuery
                                      .of(context)
                                      .size
                                      .height / 1.15,
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width / 1.45,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  cubit.model.title,
                                  style: TextStyle(
                                      fontSize: 21.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Theme
                                          .of(context)
                                          .primaryColor),
                                ),
                                const Spacer(),
                                Text(
                                  textDirection: TextDirection.ltr,
                                  "${cubit.model.discount} %",
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 14.sp),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(6),
                                  child: Text(
                                    cubit.model.price.toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.sp,
                                        color: Theme
                                            .of(context)
                                            .primaryColor),
                                  ),
                                ),
                                Text(
                                  cubit.model.priceBeforeDiscount.toString(),
                                  style: TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      fontSize: 18.sp,
                                      color: Theme
                                          .of(context)
                                          .primaryColor),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "السعر /1 كجم",
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.grey,
                                  ),
                                ),
                                const Spacer(),
                                Container(
                                  height: 35.h,
                                  width: 109.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Theme
                                        .of(context)
                                        .primaryColor
                                        .withOpacity(.13),
                                  ),
                                  child: StatefulBuilder(
                                    builder: (context, setState) =>
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                          children: [
                                            ControlButtonItem(
                                              onTap: () {
                                                cubit.amount++;
                                                cubit.updatePrice();
                                                //  amount = cubit.amount;
                                                setState(() {});
                                              },
                                              width: 29.h,
                                              height: 29.h,
                                              icon: Icons.add,
                                              iconColor:
                                              Theme
                                                  .of(context)
                                                  .primaryColor,
                                              iconSize: 20,
                                            ),
                                            Text(
                                              "${cubit.amount}",
                                              style: TextStyle(
                                                fontSize: 16.sp,
                                                color: Theme
                                                    .of(context)
                                                    .primaryColor,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            ControlButtonItem(
                                                onTap: () {
                                                  if (cubit.amount > 1) {
                                                    cubit.amount--;
                                                    cubit.updatePrice();
                                                    // amount = cubit.amount;
                                                    setState(() {});
                                                  }
                                                },
                                                width: 29.h,
                                                height: 29.h,
                                                icon: Icons.remove,
                                                iconColor:
                                                Theme
                                                    .of(context)
                                                    .primaryColor,
                                                iconSize: 20)
                                          ],
                                        ),
                                  ),
                                ),
                              ],
                            ),
                            const Divider(),
                            SizedBox(
                              height: 14.h,
                            ),
                            Align(
                              alignment: AlignmentDirectional.topStart,
                              child: Text.rich(
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.sp,
                                    color: Theme
                                        .of(context)
                                        .primaryColor),
                                TextSpan(text: "كود المنتج", children: [
                                  const TextSpan(text: "    "),
                                  TextSpan(
                                      text: cubit.model.code,
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 17.sp,
                                        fontWeight: FontWeight.normal,
                                      ))
                                ]),
                              ),
                            ),
                            SizedBox(
                              height: 14.h,
                            ),
                            const Divider(),
                            SizedBox(
                              height: 14.h,
                            ),
                            Row(
                              children: [
                                Text(
                                  "تفاصيل المنتج",
                                  style: TextStyle(
                                    fontSize: 17.sp,
                                    color: Theme
                                        .of(context)
                                        .primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Align(
                              alignment: AlignmentDirectional.topStart,
                              child: Text(
                                cubit.model.description,
                                style: TextStyle(
                                    fontSize: 14.sp, fontWeight: FontWeight.w400),
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "التقييمات",
                                    style: TextStyle(
                                        fontSize: 17.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Theme
                                            .of(context)
                                            .primaryColor),
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "عرض الكل",
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w400,
                                        // color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 87.h,
                              child: ListView.separated(
                                itemBuilder: (context, index) =>
                                const _RateItem(),
                                separatorBuilder: (context, index) =>
                                    SizedBox(
                                      width: 20.w,
                                    ),
                                itemCount: 3,
                                scrollDirection: Axis.horizontal,
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional.topStart,
                              child: Padding(
                                padding:
                                const EdgeInsets.symmetric(vertical: 16.0),
                                child: Text(
                                  "منتجات مشابهة",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17.sp,
                                      color: Theme
                                          .of(context)
                                          .primaryColor),
                                ),
                              ),
                            ),
                            BlocBuilder<ProductCubit, ProductStates>(
                              builder: (context, state) {
                                if (state is ProductSuccessState) {
                                  return SizedBox(
                                    height: 178.h,
                                    child: ListView.separated(
                                        padding: EdgeInsetsDirectional.only(
                                            bottom: 20.h),
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) =>
                                        widget.id == state.list[index].id
                                            ? SizedBox.shrink()
                                            : _SimilarityItem(
                                            model: state.list[index]),
                                        separatorBuilder: (context, index) =>
                                        widget.id == state.list[index].id
                                            ? SizedBox.shrink()
                                            : SizedBox(
                                          width: 10.w,
                                        ),
                                        itemCount: state.list.length),
                                  );
                                } else if (state is ProductGetFailedState) {
                                  return SizedBox(
                                      height: 172.h,
                                      child: Center(child: Text("FAILED")));
                                } else {
                                  return SizedBox(
                                      height: 172.h,
                                      child: Center(
                                          child: CircularProgressIndicator()));
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 60.h,
                        width: double.infinity,
                        color: Theme
                            .of(context)
                            .primaryColor,
                        padding:
                        EdgeInsetsDirectional.only(start: 27.w, end: 20.w),
                        child: Row(
                          children: [
                            Container(
                              width: 35.w,
                              height: 32.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: const Color(0xff6AA431),
                              ),
                              child: SvgPicture.asset(
                                "assets/icons/svg/shopping_card.svg",
                                width: 17.w,
                                height: 16.h,
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Builder(builder: (context) {
                              CartCubit bloc = BlocProvider.of(context);
                              return BlocConsumer(
                                bloc: bloc,
                                listener: (context, addToCartState) {
                                  if (addToCartState is AddToCartSuccessState  ) {
                                    showModalBottomSheet(
                                      context: (navigatorKey.currentContext!),
                                      backgroundColor: Colors.transparent,
                                      builder: (context) =>
                                          AddToCartSheet(model: cubit.model,amount: cubit.amount),
                                    );
                                  }
                                },
                                builder: (context, addToCartState) {
                                  return TextButton(
                                      onPressed: () {
                                        bloc.addToCart(
                                            id: widget.id,
                                            amount: BlocProvider
                                                .of<
                                                ProductDetailsCubit>(context)
                                                .amount);
                                      },
                                      child: Text(
                                        "إضافة إلي السلة",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15.sp,
                                          color: Colors.white,
                                        ),
                                      ));
                                },
                              );
                            }),
                            const Spacer(),
                            Text(
                              "${cubit.totalPrice.toStringAsFixed(2)} ر.س",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.sp,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                } else
                  return Center(child: CircularProgressIndicator());
              },
            );
          }
        ),
      ),
    );
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}

class _RateItem extends StatelessWidget {
  const _RateItem();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 87.h,
      width: 267.w,
      child: Row(
        children: [
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "محمد علي",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        width: 7.w,
                      ),
                      Icon(
                        CupertinoIcons.star_fill,
                        color: Color(0xffFF9529),
                      ),
                      Icon(
                        CupertinoIcons.star_fill,
                        color: Color(0xffFF9529),
                      ),
                      Icon(
                        CupertinoIcons.star_fill,
                        color: Color(0xffFF9529),
                      ),
                      Icon(
                        CupertinoIcons.star_fill,
                        color: Color(0xffFF9529),
                      ),
                      Icon(
                        CupertinoIcons.star,
                        color: Color(0xffD5D5D5),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 9.h,
                  ),
                  const Text(
                    "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              )),
          Container(
            clipBehavior: Clip.antiAlias,
            width: 55.h,
            height: 55.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: CachedNetworkImage(
              imageUrl:
              "https://images.pexels.com/photos/4195342/pexels-photo-4195342.jpeg?auto=compress&cs=tinysrgb&w=600",
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}

class _SimilarityItem extends StatelessWidget {
  const _SimilarityItem({required this.model});

  final ProductModel model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigateTo(ProductDetailsView(id: model.id, isFav: model.isFavorite,));
      },
      child: Container(
        width: 130.w,
        padding: EdgeInsetsDirectional.only(start: 7, end: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.1),
                offset: Offset(2, 11),
                blurRadius: 11),
          ],
          borderRadius: BorderRadius.circular(11),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.topEnd,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(11),
                  child: CachedNetworkImage(
                    imageUrl: model.mainImage,
                    width: 116.w,
                    height: 94.h,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  width: 55.w,
                  height: 19.h,
                  padding: EdgeInsetsDirectional.only(top: 3.h),
                  decoration: BoxDecoration(
                      color: Theme
                          .of(context)
                          .primaryColor,
                      borderRadius: const BorderRadiusDirectional.only(
                        topEnd: Radius.circular(11),
                        bottomStart: Radius.circular(11),
                      )),
                  child: Center(
                      child: Text(
                        "-${model.discount} %",
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold),
                      )),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              model.title,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.bold,
                color: Theme
                    .of(context)
                    .primaryColor,
              ),
            ),
            Text(
              "السعر / 1كجم",
              style: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.normal,
                color: Colors.grey,
              ),
            ),
            Row(
              children: [
                Text(
                  "${model.price} ر.س",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Theme
                        .of(context)
                        .primaryColor,
                  ),
                ),
                Text(
                  "${model.priceBeforeDiscount} ر.س",
                  style: TextStyle(
                    fontSize: 10,
                    decoration: TextDecoration.lineThrough,
                    color: Theme
                        .of(context)
                        .primaryColor,
                  ),
                ),
                Spacer(),
                Container(
                    height: 24.h,
                    width: 24.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: const Color(0xff61B80C),
                    ),
                    child: const Icon(
                      CupertinoIcons.add,
                      color: Colors.white,
                      size: 20,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
