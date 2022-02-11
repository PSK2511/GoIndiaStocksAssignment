import 'package:get/get.dart';
import 'package:stocks/app/modules/home/bindings/home_binding.dart';
import 'package:stocks/app/modules/home/views/home_view.dart';
part 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
  ];
}
