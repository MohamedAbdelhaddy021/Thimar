import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/core/logic/helper_methods.dart';
import 'package:thimar/features/products/model.dart';
import 'package:thimar/views/cart/cubit.dart';
import 'package:thimar/views/cart/view.dart';

import '../../core/design/app_button.dart';

class AddToCartSheet extends StatelessWidget {
  final ProductModel model;
  final int amount;

  const AddToCartSheet({super.key, required this.model, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      height: MediaQuery.of(context).size.height / 3.5,
      decoration: BoxDecoration(
        color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40))),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Text(
              "تم إضافة المنتج بنجاح",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14.sp,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          Divider(),
          Container(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.r),
                  child: CachedNetworkImage(
                    imageUrl: "${model.mainImage}",
                    height: 78,
                    width: 98,
                    fit: BoxFit.cover,
                  ),
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
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          Text(
                            "${model.amount}",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w300,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            "${model.price*amount}  ر.س",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ),
          Divider(),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Expanded(
                    child:
                        AppButton(title: "التحويل إلى السلة", onPress: () {
                          BlocProvider.of<CartCubit>(context).getCartItems();
                          navigateTo(CartView());
                        })),
                SizedBox(
                  width: 17,
                ),
                Expanded(
                    child: SizedBox(
                  height: 60,
                  child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.r)),
                      ),
                      child: Text(
                        "تصفح العروض",
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.w500),
                      )),
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
