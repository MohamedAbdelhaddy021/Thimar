import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/views/home/pages/my_account/pages/about_app/cubit.dart';
import 'package:thimar/views/home/pages/my_account/pages/about_app/states.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: GestureDetector(
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
        title: Text("عن التطبيق",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        physics: BouncingScrollPhysics(),
        children: [
          Image.asset("assets/images/logo.png", width: 160, height: 160,),
          Builder(
            builder: (context) {
              AboutCubit cubit =BlocProvider.of(context)..getData();
              return BlocBuilder(bloc: cubit,
                builder: (context, state) {
                if(state is AboutSuccessState){
                  return Text(state.about.about,style: TextStyle(fontSize: 15.sp),);
                }else {
                  return SizedBox.shrink();
                }
                },);
            }
          )
        ],
      ),
    );
  }
}
