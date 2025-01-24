import 'package:get/get.dart';
import 'results_controller.dart';

class ResultsBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(ResultsController());
    }
}