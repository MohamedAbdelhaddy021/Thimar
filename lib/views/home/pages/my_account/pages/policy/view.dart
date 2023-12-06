import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/views/home/pages/my_account/pages/policy/cubit.dart';
import 'package:thimar/views/home/pages/my_account/pages/policy/model.dart';
import 'package:thimar/views/home/pages/my_account/pages/policy/states.dart';

class PrivacyPolicyPage extends StatelessWidget {
  PrivacyPolicyPage({super.key,});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            padding: EdgeInsetsDirectional.only(
              start: 8,
            ),
            margin: EdgeInsets.all(8),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11),
              color: Theme.of(context).primaryColor.withOpacity(0.13),
            ),
            child: Center(
              child: Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ),
        title: Text("سياسة الخصوصية",
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            )),
      ),
      body: BlocProvider(
        create: (context) => PolicyCubit()..getData(),
        child: BlocBuilder<PolicyCubit,PolicyStates>(
          builder: (context, state) {
          if(state is GetPolicySuccessState){
            return ListView(
              padding: EdgeInsetsDirectional.only(top: 30.h,start: 16,end: 16),
              physics: BouncingScrollPhysics(),
              children: [
                Text(state.policy.policy,style: TextStyle(fontSize: 15.sp),),
              ],
            );
          }else if(state is GetPolicyFailedState) {
            return Text("FAILED");
          }else
            {
              return Column();
            }
        },),
      ),
    );
  }
}
