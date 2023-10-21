import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 322.h,
                        width: double.infinity,
                        alignment: AlignmentDirectional.bottomCenter,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadiusDirectional.only(
                            bottomStart: Radius.circular(40),
                            bottomEnd: Radius.circular(40),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: CachedNetworkImage(
                            imageUrl:
                                "https://img.freepik.com/free-vector/realistic-tomato-isolated_1284-6146.jpg",
                            width: 200.w,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.only(
                          start: 16.0.w,
                          end: 17.w,
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.only(top: 22.5.h),
                              child: Row(
                                children: [
                                  _ControlButtonItem(
                                    width: 41.h,
                                    height: 41.h,
                                    icon: CupertinoIcons.back,
                                    iconColor: Theme.of(context)
                                        .primaryColor
                                        .withOpacity(.80),
                                    iconSize: 28,
                                    color: Theme.of(context)
                                        .primaryColor
                                        .withOpacity(.13),
                                  ),
                                  const Spacer(),
                                  _ControlButtonItem(
                                    width: 41.h,
                                    height: 41.h,
                                    icon: Icons.favorite_border,
                                    iconColor: Theme.of(context)
                                        .primaryColor
                                        .withOpacity(.80),
                                    iconSize: 28,
                                    color: Theme.of(context)
                                        .primaryColor
                                        .withOpacity(.13),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 227.h,),
                            SmoothPageIndicator(
                              count:  4,
                              axisDirection: Axis.horizontal,
                              effect:  WormEffect(
                                dotWidth: 8.h,
                                  dotHeight: 8.h,
                                  radius: 14,
                                  paintStyle:  PaintingStyle.stroke,
                                  strokeWidth:  1.5,
                                  dotColor:  Colors.grey,
                                  activeDotColor:  Theme.of(context).primaryColor
                              ), controller: PageController(),
                            ),
                            SizedBox(
                              height: 24.h,
                            ),
                            Row(
                              children: [
                                Text(
                                  "طماطم",
                                  style: TextStyle(
                                      fontSize: 22.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).primaryColor),
                                ),
                                const Spacer(),
                                const Text(
                                  "40%",
                                  style: TextStyle(color: Colors.red),
                                ),
                                Text(
                                  " 45 ر.س",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.sp,
                                      color: Theme.of(context).primaryColor),
                                ),
                                Text(
                                  " 54 ر.س",
                                  style: TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      fontSize: 18.sp,
                                      color: Theme.of(context).primaryColor),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "السعر / 1كجم",
                                  style: TextStyle(
                                    fontSize: 19.sp,
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
                                    color: Theme.of(context)
                                        .primaryColor
                                        .withOpacity(.13),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    // crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      _ControlButtonItem(
                                        width: 29.h,
                                        height: 29.h,
                                        icon: Icons.add,
                                        iconColor:
                                            Theme.of(context).primaryColor,
                                        iconSize: 20,
                                      ),
                                      Text(
                                        "5",
                                        style: TextStyle(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                      _ControlButtonItem(
                                          width: 29.h,
                                          height: 29.h,
                                          icon: Icons.remove,
                                          iconColor:
                                              Theme.of(context).primaryColor,
                                          iconSize: 20)
                                    ],
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
                                    color: Theme.of(context).primaryColor),
                                TextSpan(text: "كود المنتج", children: [
                                  const TextSpan(text: "    "),
                                  TextSpan(
                                      text: "56638",
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
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق. إذا كنت تحتاج إلى عدد أكبر من الفقرات يتيح لك مولد النص العربى زيادة عدد الفقرات كما تريد، النص لن يبدو مقسما ولا يحوي أخطاء لغوية، مولد النص العربى مفيد لمصممي المواقع على وجه الخصوص، حيث يحتاج العميل فى كثير من الأحيان أن يطلع على صورة حقيقية لتصميم الموقع.",
                              style: TextStyle(
                                  fontSize: 14.sp, fontWeight: FontWeight.w300),
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 16.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "التقييمات",
                                    style: TextStyle(
                                        fontSize: 17.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).primaryColor),
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
                                separatorBuilder: (context, index) => SizedBox(
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
                                      color: Theme.of(context).primaryColor),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 172.h,
                              child: ListView.separated(
                                padding: EdgeInsetsDirectional.only(bottom: 20.h),
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) =>
                                      const _SimilarityItem(),
                                  separatorBuilder: (context, index) =>
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                  itemCount: 6),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 60.h,
              width: double.infinity,
              color: Theme.of(context).primaryColor,
              padding: EdgeInsetsDirectional.only(start: 27.w, end: 20.w),
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
                  TextButton(onPressed: (){}, child: Text(
                    "إضافة إلي السلة",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp,
                      color: Colors.white,
                    ),
                  )),
                  const Spacer(),
                  Text(
                    "225 ر.س",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
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
  const _SimilarityItem();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 172.h,
      width: 130.w,
      padding: EdgeInsetsDirectional.only(start: 7.0.w,),
      decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(color: Colors.white, offset: Offset(2, 11)),
          ],
          borderRadius: BorderRadius.circular(11),
          border: Border.all(color: Colors.grey.withOpacity(.12))),
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(11),
                child: CachedNetworkImage(
                  imageUrl: "https://clipart-library.com/images/8cxrGXrzi.png",
                  width: 116.w,
                  height: 94.h,
                  fit: BoxFit.contain,
                ),
              ),
              Text(
                "جزر",
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              const Text(
                "السعر / 1كجم",
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey,
                ),
              ),
              Row(
                children: [
                  Text(
                    "45 ر.س",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  Text(
                    "56 ر.س",
                    style: TextStyle(
                      fontSize: 10,
                      decoration: TextDecoration.lineThrough,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
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
          Container(
            width: 55.w,
            height: 19.h,
            padding: EdgeInsetsDirectional.only(top: 3.h),
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: const BorderRadiusDirectional.only(
                  topEnd: Radius.circular(11),
                  bottomStart: Radius.circular(11),
                )),
            child: Center(
                child: Text(
              "-3 %",
              textDirection: TextDirection.ltr,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold),
            )),
          ),
        ],
      ),
    );
  }
}

class _ControlButtonItem extends StatelessWidget {
  const _ControlButtonItem(
      {super.key,
      required this.width,
      required this.height,
      this.color = Colors.white,
      required this.icon,
      required this.iconColor,
      required this.iconSize});

  final double width, height, iconSize;
  final Color color, iconColor;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        debugPrint("YES IT PRESS");
      },
      child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(9.r),
          ),
          child: Center(
            child: Icon(
              icon,
              size: iconSize,
              color: iconColor,
            ),
          )),
    );
  }
}
