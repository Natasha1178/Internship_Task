import 'package:get/state_manager.dart';
class CounterController  extends GetxController{
  RxInt count = 0.obs;
  void increament(){
    count.value++;
    print(count);
  }
  void decreament(){
    if(count>0){
    count.value--;
    }
    
  }
   
}