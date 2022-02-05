import 'package:get/get.dart';
import 'package:interview/app/modules/test_one/view_models/register_view_model.dart';

class TestOneBindings extends Bindings {
  @override
  void dependencies() {
    Get.create<RegisterViewModel>(
      () => RegisterViewModel(),
    );
  }
}
