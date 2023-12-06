import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar/views/home/pages/my_orders/states.dart';

class MyOrderCubit extends Cubit<MyOrderStates>{
  MyOrderCubit():super(MyOrderStates());
}