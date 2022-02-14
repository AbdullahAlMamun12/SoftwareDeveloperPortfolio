import 'package:get/get.dart';
import 'package:portfolio_app/constraints/screen_type.dart';

class UiController extends GetxController{
  var isActiveAppBarBgColor = false.obs;
  var activeNavButton = 0.obs;
  var isHoverProfileImage = false.obs;
  var screenType = MainScreenType.HOME.obs;
}