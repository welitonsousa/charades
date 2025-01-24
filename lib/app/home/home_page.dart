import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Image.asset(
            'assets/images/logo.png',
            width: 150,
          ),
          SizedBox(height: 20),
          Center(
            child: Obx(() {
              if (controller.timerRunneing) {
                return Text(
                  controller.showTimer.toString(),
                  style: TextStyle(
                    fontSize: 60,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                );
              }
              if (controller.loading.value) {
                return CircularProgressIndicator();
              } else {
                return ElevatedButton(
                  onPressed: controller.startGame,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: Text(
                    "Começar",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                );
              }
            }),
          ),
        ],
      ),
    );
  }
}
