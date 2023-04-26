import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController{
  RxBool switchValue=false.obs;



  onEventSwitch(bool val){
    switchValue.value=val;
    GetStorage().write('theme',val);
  }

  void getTheme() {
    var theme=GetStorage().read('theme');
    onEventSwitch(theme??false);
  }
}