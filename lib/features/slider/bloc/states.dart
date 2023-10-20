import '../model.dart';

class SliderStates {}

class SliderLoadingState extends SliderStates {}

class SliderFailedState extends SliderStates {
  final String msg;

  SliderFailedState({required this.msg});
}

class SliderSuccessState extends SliderStates {
  final List<SliderModel> list;

  SliderSuccessState({required this.list});
}
