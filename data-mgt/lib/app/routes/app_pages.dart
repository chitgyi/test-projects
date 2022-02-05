import 'package:get/get.dart';
import 'package:interview/app/modules/test_one/bindings/test_one_bindings.dart';
import 'package:interview/app/modules/test_one/pages/login_page.dart';
import 'package:interview/app/modules/test_one/pages/register_page.dart';

part 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.login,
      page: () => const LoginPage(),
    ),
    GetPage(
      name: Routes.register,
      page: () => const RegisterPage(),
      binding: TestOneBindings(),
    ),
  ];
}
