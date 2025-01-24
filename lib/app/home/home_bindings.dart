import 'package:charades/repositories/words_repository.dart';
import 'package:get/get.dart';
import 'home_controller.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(WordRepository());
    Get.put(HomeController(wordRepository: Get.find()));
  }
}
