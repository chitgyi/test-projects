import 'package:get/get.dart';
import 'package:code_management/app/core/utils/view_state.dart';

abstract class ViewModel extends GetxController {
  ViewState viewState = ViewState.loading;
  String? get errorMessage;
}
