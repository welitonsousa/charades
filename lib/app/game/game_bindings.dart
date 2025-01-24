import 'package:get/get.dart';
import 'game_controller.dart';

class GameBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(GameController());
    }
}