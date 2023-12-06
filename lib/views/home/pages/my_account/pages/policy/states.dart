import 'package:thimar/views/home/pages/my_account/pages/policy/model.dart';

class PolicyStates {}

class GetPolicySuccessState extends PolicyStates {
  final PolicyModel policy;

  GetPolicySuccessState({required this.policy});
}

class GetPolicyFailedState extends PolicyStates {}

class GetPolicyLoadingState extends PolicyStates {}
