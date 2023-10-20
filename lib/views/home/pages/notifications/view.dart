import 'package:flutter/material.dart';

import '../../../../main.dart';
import 'model.dart';

class NotificationsPage extends StatelessWidget {
  NotificationsPage({super.key});

  final List<NotificationModel> list = [
    NotificationModel(
      title: "تم قبول طلبك وجاري تحضيره الأن",
      body:
          "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى",
      time: "منذ ساعتان",
      imgUrl: "https://cdn-icons-png.flaticon.com/128/6269/6269876.png",
    ),
    NotificationModel(
      title: "رسالة إدارية",
      body:
          "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى",
      time: "منذ ساعتان",
      imgUrl: "https://cdn-icons-png.flaticon.com/128/9134/9134106.png",
    ),
    NotificationModel(
      title: "عروض جديدة بإنتظارك",
      body:
          "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى",
      time: "منذ ساعتان",
      imgUrl: "https://cdn-icons-png.flaticon.com/128/8923/8923727.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "الإشعارات",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemBuilder: (context, index) => _Item(model: list[index],),
          itemCount: list.length,
        ),
      ),
    );
  }
}


   class _Item extends StatelessWidget {
      const _Item({super.key, required this.model,});

     final NotificationModel model;

     @override
     Widget build(BuildContext context) {
       return  Padding(
         padding: const EdgeInsets.only(bottom: 16.0),
         child: Row(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Container(
                 height: 40,
                 width: 40,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(8),
                   color: Theme.of(context).primaryColor,
                 ),
                 child: Center(
                     child: Image.network(
                       model.imgUrl,
                       height: 20,
                       width: 20,
                     ))),
             const SizedBox(
               width: 10,
             ),
             Expanded(
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text(
                     model.title,
                     style: const TextStyle(
                       fontWeight: FontWeight.w500,
                       fontSize: 16,
                     ),
                   ),
                   Text(
                     model.body,
                     style: const TextStyle(
                         fontWeight: FontWeight.w300,
                         fontSize: 12,
                         color: Color(0xff989898)),
                   ),
                   Text(
                     model.time,
                     style: const TextStyle(
                       fontWeight: FontWeight.w300,
                       fontSize: 15,
                     ),
                   ),
                 ],
               ),
             ),
           ],
         ),
       );
     }
   }

