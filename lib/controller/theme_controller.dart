import 'package:get/get.dart';

class ThemeController extends GetxController{
  RxBool switchValue=false.obs;



  onEventSwitch(bool val){
    switchValue.value=val;
  }
}