import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thimar/views/home/pages/favs/view.dart';
import 'package:thimar/views/home/pages/home/view.dart';
import 'package:thimar/views/home/pages/my_account/view.dart';
import 'package:thimar/views/home/pages/my_orders/view.dart';
import 'package:thimar/views/home/pages/notifications/view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;

  List<Widget> pages = [
     const HomePage(),
    const MyOrdersPage(),
    NotificationsPage(),
    const FavPage(),
     MyAccountPage(),
  ];

  List<String> icons = [
    "home.svg",
    "my_orders.svg",
    "notification.svg",
    "fav.svg",
    "my_account.svg",
  ];
  List<String> labels = [
    "الرئيسية",
    "طلباتي",
    "Gالإشعارات",
    "المفضلة",
    "حسابي",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: const Color(0xffAED489),
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        onTap: (value) {
          currentIndex = value;
          setState(() {});
        },
        currentIndex: currentIndex,
        items: <BottomNavigationBarItem>[
          ...List.generate(
              icons.length,
              (index) => BottomNavigationBarItem(
                  label: labels[index],
                  icon: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: SvgPicture.asset(
                      color: currentIndex == index
                          ? Colors.white
                          : const Color(0xffAED489),
                      "assets/icons/svg/${icons[index]}",
                      width: 23,
                      height: 23,
                    ),
                  )))
        ],
      ),
      body: SafeArea(child: pages[currentIndex]),
    );
  }
}
