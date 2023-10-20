import 'package:flutter/material.dart';

import '../../../../core/design/app_button.dart';

class MyOrdersPage extends StatelessWidget {
  const MyOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "طلباتي",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsetsDirectional.only(start: 16, end: 17),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: AppButton(
                  title: "الحاليه",
                  onPress: () {},
                  radius: 10,
                )),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: AppButton(
                  title: "المنتهية",
                  onPress: () {},
                  color: Colors.grey.withOpacity(.5),
                )),
                const SizedBox(
                  height: 22.5,
                ),
              ],
            ),
            const SizedBox(
              height: 22.5,
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => _Item(),
                itemCount: 4,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.only(bottom: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.02),
              offset: const Offset(0, 6),
              blurRadius: 17,
              blurStyle: BlurStyle.outer,
            )
          ]),
      height: 100,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 4.0,bottom: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "طلب #4587",
                  style: TextStyle(color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold, fontSize: 17),
                ),
                const Text(
                  "27,يونيو,2021",
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 12,
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    const _ItemYouBuy(
                        img:
                        "https://img.freepik.com/free-photo/fresh-red-tomatoes_2829-13449.jpg?size=626&ext=jpg&uid=R100743807&ga=GA1.1.699160303.1690903232&semt=sph"),
                    const _ItemYouBuy(
                        img:
                        "https://img.freepik.com/free-vector/isolated-orange-carrot-cartoon_1308-127216.jpg?size=626&ext=jpg&uid=R100743807&ga=GA1.2.699160303.1690903232&semt=sph"),
                    const _ItemYouBuy(
                        img:
                        "https://img.freepik.com/free-photo/slice-watermelon-white-background_93675-128140.jpg?size=626&ext=jpg&uid=R100743807&ga=GA1.2.699160303.1690903232&semt=sph"),
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          color: const Color(0xffEDF5E6),
                          borderRadius: BorderRadius.circular(7)),
                      child: const Center(
                          child: Text(
                            "+2",
                            style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                    // ItemYouBuy(img: "img"),
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding:  const EdgeInsetsDirectional.only(top: 4.0,bottom: 4,end: 9),
            child: Column(
              children: [
                SizedBox(
                  child: FilledButton(
                    onPressed: () {},
                    style: FilledButton.styleFrom(
                        backgroundColor: const Color(0xffEDF5E6)),
                    child: Text(
                      "بإنتظار الموافقة",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const Spacer(),
                Text(
                  "180 ر.س",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}



class _ItemYouBuy extends StatelessWidget {
  const _ItemYouBuy({required this.img});

  final String img;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Container(
        height: 25,
        width: 25,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            border: Border.all(color: Colors.grey.withOpacity(.6))),
        child: Center(
            child: Image.network(
              img,
              height: 20,
              width: 20,
              fit: BoxFit.scaleDown,
            )),
      ),
    );
  }
}

