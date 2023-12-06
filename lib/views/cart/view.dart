import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thimar/core/design/app_button.dart';
import 'package:thimar/core/logic/helper_methods.dart';
import 'package:thimar/views/cart/states.dart';
import 'package:thimar/views/complete_order/view.dart';

import '../../core/design/custom_icon_filled_button.dart';
import 'cubit.dart';
import 'model.dart';

class CartView extends StatefulWidget {
  const CartView({
    super.key,
  });

  @override
  State<CartView> createState() => _ShopCartViewState();
}

class _ShopCartViewState extends State<CartView> {
  late CartCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = BlocProvider.of(context)
      ..getCartItems();
  }

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
              color: Theme
                  .of(context)
                  .primaryColor
                  .withOpacity(0.13),
            ),
            child: Center(
              child: Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: Theme
                    .of(context)
                    .primaryColor,
              ),
            ),
          ),
        ),
        title: Text("السلة"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
        child: BlocBuilder(
          bloc: cubit,
          buildWhen: (previous, current) =>
          current is GetCartItemsSuccessState ||
              current is GetCartItemsLoadingState ,
          builder: (context, state) {
            print(state);
            print("*" * 60);
            if (state is GetCartItemsSuccessState) {
              return Column(
                children: [
                  ListView.separated(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) =>
                          _Item(model: state.model.list[index]),
                      separatorBuilder: (context, index) =>
                          SizedBox(
                            height: 10,
                          ),
                      itemCount: state.model.list.length),
                  SizedBox(
                    height: 10.0,
                  ),
                  if (state.model.list.isNotEmpty)
                    Expanded(
                      flex: 2,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            TextFormField(
                              onTapOutside: (val) {
                                FocusManager.instance.primaryFocus!
                                    .unfocus();
                              },
                              decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.circular(15.0)),
                                  suffixIcon: Container(
                                    height: 40,
                                    width: 80,
                                    margin: EdgeInsetsDirectional.all(8),
                                    child: AppButton(
                                        title: "تطبيق", onPress: () {}),
                                  ),
                                  fillColor: Theme
                                      .of(context)
                                      .primaryColor
                                      .withOpacity(0.05),
                                  hintText:
                                  "عندك كوبون ؟ ادخل رقم الكوبون"),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "جميع الأسعار تشمل قيمة الضريبة المضافة 15 %",
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500,
                                color: Theme
                                    .of(context)
                                    .primaryColor,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 111,
                              padding: EdgeInsets.symmetric(horizontal: 9),
                              decoration: BoxDecoration(
                                  color: Color(0xffF3F8EE),
                                  borderRadius:
                                  BorderRadius.circular(13.r)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "إجمالي المنتجات",
                                        style: TextStyle(
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w500,
                                            color: Theme
                                                .of(context)
                                                .primaryColor),
                                      ),
                                      Spacer(),
                                      Text(
                                        "${state.model
                                            .totalPriceBeforeDiscount} ر.س ",
                                        style: TextStyle(
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w500,
                                            color: Theme
                                                .of(context)
                                                .primaryColor),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "الخصم",
                                        style: TextStyle(
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w500,
                                            color: Theme
                                                .of(context)
                                                .primaryColor),
                                      ),
                                      Spacer(),
                                      Text(
                                        "${state.model.totalDiscount
                                            .toStringAsFixed(2)} ر.س",
                                        style: TextStyle(
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w500,
                                            color: Theme
                                                .of(context)
                                                .primaryColor),
                                      ),
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    children: [
                                      Text(
                                        "المجموع",
                                        style: TextStyle(
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w500,
                                            color: Theme
                                                .of(context)
                                                .primaryColor),
                                      ),
                                      Spacer(),
                                      Text(
                                        "${state.model
                                            ?.totalPriceWithVat} ر.س ",
                                        style: TextStyle(
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w500,
                                            color: Theme
                                                .of(context)
                                                .primaryColor),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 11,
                            ),
                            SizedBox(
                                height: 60,
                                width: double.infinity,
                                child: AppButton(
                                  title: "الانتقال لإتمام الطلب",
                                  onPress: () {
                                    navigateTo(CompleteTheOrder());
                                  },
                                )),
                          ],
                        ),
                      ),
                    )
                ],
              );
            }
            else if (state is GetCartItemsFailedState) {
              return Text("FAILED");
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  _Item({required this.model});

  final CartModel model;

  @override
  Widget build(BuildContext context) {
    // return Builder(
    //     builder: (context) {
    //       CartCubit cubit = BlocProvider.of(context);
    //       return BlocBuilder(
    //         buildWhen: (previous, current) => current is RemoveItemSuccessState ||current is RemoveItemLoadingState,
    //         bloc: cubit, builder: (context, state)
    //       {
    //         if(state is GetCartItemsSuccessState){
    //           return Container(
    //             height: 100,
    //             width: double.infinity,
    //             padding: EdgeInsetsDirectional.only(top: 8, bottom: 8, start: 6, end: 16),
    //             decoration: BoxDecoration(
    //                 color: Colors.white,
    //                 borderRadius: BorderRadius.circular(15),
    //                 boxShadow: [
    //                   BoxShadow(
    //                     color: Colors.black.withOpacity(.03),
    //                     offset: Offset(0, 6),
    //                     spreadRadius: 5,
    //                     blurRadius: 17,
    //                   ),
    //                 ]),
    //             child: Row(
    //               children: [
    //                 CachedNetworkImage(
    //                   imageUrl: "${model.image}",
    //                   height: 78,
    //                   width: 98,
    //                   fit: BoxFit.cover,
    //                 ),
    //                 SizedBox(
    //                   width: 9,
    //                 ),
    //                 Expanded(
    //                   child: SizedBox(
    //                       height: 78,
    //                       child: Column(
    //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                         crossAxisAlignment: CrossAxisAlignment.start,
    //                         children: [
    //                           Text(
    //                             "${model.title}",
    //                             style: TextStyle(
    //                               fontSize: 15,
    //                               fontWeight: FontWeight.bold,
    //                               color: Theme
    //                                   .of(context)
    //                                   .primaryColor,
    //                             ),
    //                           ),
    //                           Text(
    //                             "${model.price}  ر.س",
    //                             style: TextStyle(
    //                               fontSize: 15,
    //                               fontWeight: FontWeight.bold,
    //                               color: Theme
    //                                   .of(context)
    //                                   .primaryColor,
    //                             ),
    //                           ),
    //                           StatefulBuilder(
    //                             builder: (context, setState) =>
    //                                 Container(
    //                                   height: 30,
    //                                   width: 80,
    //                                   padding: EdgeInsetsDirectional.all(2),
    //                                   decoration: BoxDecoration(
    //                                       borderRadius: BorderRadius.circular(7),
    //                                       color: Color(0xffebf2e5)),
    //                                   child: Row(
    //                                     mainAxisAlignment: MainAxisAlignment.spaceAround,
    //                                     children: [
    //                                       ControlButtonItem(
    //                                         onTap: () {
    //                                           // model.amount++;
    //                                           // setState((){});
    //                                         },
    //                                         height: 23,
    //                                         width: 23,
    //                                         icon: Icons.add,
    //                                         iconColor: Theme
    //                                             .of(context)
    //                                             .primaryColor,
    //                                         iconSize: 18,
    //                                         radius: 7,
    //                                       ),
    //                                       Center(
    //                                           child: Text(
    //                                             "${model.amount}",
    //                                             style: TextStyle(
    //                                                 fontWeight: FontWeight.w400,
    //                                                 fontSize: 15.sp),
    //                                           )),
    //                                       ControlButtonItem(
    //                                         onTap: () {
    //                                           // model.amount--;
    //                                           // setState((){});
    //                                         },
    //                                         height: 23,
    //                                         width: 23,
    //                                         icon: Icons.remove,
    //                                         iconColor: Theme
    //                                             .of(context)
    //                                             .primaryColor,
    //                                         iconSize: 18,
    //                                         radius: 7,
    //                                       )
    //                                     ],
    //                                   ),
    //                                 ),
    //                           )
    //                         ],
    //                       )),
    //                 ),
    //                 GestureDetector(
    //                   onTap: () {
    //                     cubit.deleteFromCart(id: model.id);
    //                   },
    //                   child: Container(
    //                     width: 27.w,
    //                     height: 27.w,
    //                     decoration: BoxDecoration(
    //                         color: Color(0xffffe3e3),
    //                         borderRadius: BorderRadius.circular(7)),
    //                     child: SvgPicture.asset(
    //                       "assets/icons/svg/trash.svg",
    //                       width: 14.w,
    //                       height: 14.w,
    //                       fit: BoxFit.scaleDown,
    //                     ),
    //                   ),
    //                 )
    //               ],
    //             ),
    //           );
    //         }else if(state is GetCartItemsFailedState){
    //           return Text("FAiled");
    //         }else {
    //           return CircularProgressIndicator();
    //         }
    //       });
    //     }
    // );
    return Container(
      height: 100,
      width: double.infinity,
      padding: EdgeInsetsDirectional.only(top: 8, bottom: 8, start: 6, end: 16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.03),
              offset: Offset(0, 6),
              spreadRadius: 5,
              blurRadius: 17,
            ),
          ]),
      child: Row(
        children: [
          CachedNetworkImage(
            imageUrl: "${model.image}",
            height: 78,
            width: 98,
            fit: BoxFit.cover,
          ),
          SizedBox(
            width: 9,
          ),
          Expanded(
            child: SizedBox(
                height: 78,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${model.title}",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Theme
                            .of(context)
                            .primaryColor,
                      ),
                    ),
                    Text(
                      "${model.price}  ر.س",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Theme
                            .of(context)
                            .primaryColor,
                      ),
                    ),
                    StatefulBuilder(
                      builder: (context, setState) =>
                          Container(
                            height: 30,
                            width: 80,
                            padding: EdgeInsetsDirectional.all(2),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: Color(0xffebf2e5)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ControlButtonItem(
                                  onTap: () {
                                    // model.amount++;
                                    // setState((){});
                                  },
                                  height: 23,
                                  width: 23,
                                  icon: Icons.add,
                                  iconColor: Theme
                                      .of(context)
                                      .primaryColor,
                                  iconSize: 18,
                                  radius: 7,
                                ),
                                Center(
                                    child: Text(
                                      "${model.amount}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15.sp),
                                    )),
                                ControlButtonItem(
                                  onTap: () {
                                    // model.amount--;
                                    // setState((){});
                                  },
                                  height: 23,
                                  width: 23,
                                  icon: Icons.remove,
                                  iconColor: Theme
                                      .of(context)
                                      .primaryColor,
                                  iconSize: 18,
                                  radius: 7,
                                )
                              ],
                            ),
                          ),
                    )
                  ],
                )),
          ),
          GestureDetector(

            onTap: () {
              BlocProvider.of<CartCubit>(context).deleteFromCart(id: model.id);
            },
            child: Container(
              width: 27.w,
              height: 27.w,
              decoration: BoxDecoration(
                  color: Color(0xffffe3e3),
                  borderRadius: BorderRadius.circular(7)),
              child: SvgPicture.asset(
                "assets/icons/svg/trash.svg",
                width: 14.w,
                height: 14.w,
                fit: BoxFit.scaleDown,
              ),
            ),
          )
        ],
      ),
    );
  }
}
