import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class HomeController extends GetxController {
  PersistentTabController persistentTabController = PersistentTabController(initialIndex: 0);

  RxInt index = 0.obs;

  void onTabChanged(int index) => this.index.value = index;
}
