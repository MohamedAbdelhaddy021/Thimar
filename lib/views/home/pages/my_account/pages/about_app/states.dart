import 'package:thimar/views/home/pages/my_account/pages/about_app/model.dart';

class AboutStates{}

class AboutSuccessState extends AboutStates {
  final AboutModel about;

  AboutSuccessState({required this.about});
}
class AboutFailedState extends AboutStates {}
class AboutLoadingState extends AboutStates {}