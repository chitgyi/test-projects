import 'package:code_management/app/modules/home/bindings/movie_binding.dart';
import 'package:code_management/app/modules/home/pages/home_page.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
      binding: MovieBindings(),
    ),
  ];
}
