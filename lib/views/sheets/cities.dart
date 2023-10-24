import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../features/cities/bloc/cubit.dart';
import '../../features/cities/bloc/states.dart';
import '../../features/cities/cities.dart';

class CitiesSheet extends StatefulWidget {
  const CitiesSheet({super.key});

  @override
  State<CitiesSheet> createState() => _CitiesSheetState();
}

class _CitiesSheetState extends State<CitiesSheet> {
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        CitiesCubit cubit =BlocProvider.of(context);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "اختر مدينتك ",
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
            ),
            BlocBuilder(
              bloc: cubit,
              builder: (context, state) {
                if (state is CitiesLoadingState) {
                  return const Expanded(child: Center(child: CircularProgressIndicator()));
                } else if(state is  CitiesSuccessState){
                  return Expanded(
                    child: ListView.builder(
                        itemCount: state.list.length,
                        padding: const EdgeInsets.all(16),
                        itemBuilder: (_, index) => _ItemCity(
                              model: state.list[index],
                            )),
                  );
                }else {
                  return const Text("Failed");
                }
              },
            ),
          ],
        );
      }
    );
  }
}

class _ItemCity extends StatelessWidget {
  const _ItemCity({required this.model});

  final CityModel model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context, model);
      },
      child: Container(
        height: 40,
        margin: const EdgeInsetsDirectional.only(bottom: 16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Theme.of(context).primaryColor.withOpacity(.2)),
        child: Center(child: Text(model.name)),
      ),
    );
  }
}
