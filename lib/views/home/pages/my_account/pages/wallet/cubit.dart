import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar/views/home/pages/my_account/pages/wallet/states.dart';

class WalletCubit extends Cubit<WalletStates>{
  WalletCubit():super(WalletStates());
}