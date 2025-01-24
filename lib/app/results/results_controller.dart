import 'package:charades/models/result_model.dart';
import 'package:get/get.dart';

class ResultsController extends GetxController {

  List<ResultModel> result = [];
  String showCounterResult = '';

  @override
  void onInit() {
    result = Get.arguments;
    final rigts = result.where((element) => element.right).length;
    showCounterResult = '$rigts de ${result.length} palavras';
    super.onInit();
  }
}