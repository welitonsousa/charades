import 'package:charades/app/game/game_bindings.dart';
import 'package:charades/app/game/game_page.dart';
import 'package:charades/app/home/home_bindings.dart';
import 'package:charades/app/home/home_page.dart';
import 'package:charades/app/results/results_bindings.dart';
import 'package:charades/app/results/results_page.dart';
import 'package:get/get.dart';

class Pages {
  static const HOME = '/';
  static const RESULTS = '/game/results';
  static const GAME = '/game';
}

final getPages = <GetPage>[
  GetPage(
    name: Pages.HOME,
    binding: HomeBindings(),
    page: () => HomePage(),
  ),
  GetPage(
    name: Pages.GAME,
    binding: GameBindings(),
    page: () => GamePage(),
  ),
  GetPage(
    name: Pages.RESULTS,
    binding: ResultsBindings(),
    page: () => ResultsPage(),
  ),
];
