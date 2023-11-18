import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thimar/views/cart/states.dart';

import '../../core/design/custome_icon_filled_button.dart';
import 'cubit.dart';
import 'model.dart';

class ShopCartView extends StatelessWidget {
  const ShopCartView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: ControlButtonItem(
          onTap: (){Navigator.pop(context);},
          icon: Icons.arrow_back_ios,
          iconSize: 20,
          width: 20,
          height: 20,
          iconColor: Theme.of(context).primaryColor,
          color: Theme.of(context).primaryColor.withOpacity(.13),
        ),
        title: Text("السلة"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<CartCubit, CartStates>(
            builder: (context, state) {
              print(state);
              if (state is GetCartItemsSuccessState) {
                return ListView.separated(
                    itemBuilder: (context, index) =>
                        _Item(model: state.list[index]),
                    separatorBuilder: (context, index) => SizedBox(
                          height: 10,
                        ),
                    itemCount: state.list.length);
              } else if (state is GetCartItemsFailedState) {
                return Text("FAILED");
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  _Item({super.key, required this.model});

  final CartModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 94,
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
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    Text(
                      "${model.price}  ر.س",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    Container(
                      height: 27,
                      width: 72,
                      padding: EdgeInsetsDirectional.all(2),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Color(0xffebf2e5)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ControlButtonItem(
                            height: 23,
                            width: 23,
                            icon: Icons.add,
                            iconColor: Theme.of(context).primaryColor,
                            iconSize: 18,
                            radius: 7,
                          ),
                          Expanded(
                            child: Center(
                                child: Text(
                              "${model.amount}",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 15),
                            )),
                          ),
                          ControlButtonItem(
                            height: 23,
                            width: 23,
                            icon: Icons.remove,
                            iconColor: Theme.of(context).primaryColor,
                            iconSize: 18,
                            radius: 7,
                          )
                        ],
                      ),
                    )
                  ],
                )),
          ),
          Container(
            width: 27,
            height: 27,
            decoration: BoxDecoration(
                color: Color(0xffffe3e3),
                borderRadius: BorderRadius.circular(7)),
            child: SvgPicture.asset(
              "assets/icons/svg/trash.svg",
              width: 14,
              height: 14,
              fit: BoxFit.scaleDown,
            ),
          )
        ],
      ),
    );
  }
}
