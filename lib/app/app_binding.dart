import 'package:get/get.dart';
import 'package:stocks/app/data/network/network_requester.dart';
import 'package:stocks/app/data/repository/stock_repository.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkRequester(), permanent: true);
    Get.put(StockRepository(), permanent: true);
  }
}
