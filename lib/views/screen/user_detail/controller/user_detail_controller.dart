import 'package:get/get.dart';
import 'package:user_test/service/api_service.dart';
import 'package:user_test/utils/extention_utility.dart';
import 'package:user_test/views/screen/home/model/user_model.dart';

class UserDetailController extends GetxController{
  RxBool isLoading = false.obs;
  RxString error = "".obs;
  Rx<UserModel> userData = UserModel().obs;
  final _apiService = ApiService();

  getOneUser({required String id}) async {
    isLoading.value = true;
    error.value = "";
    try{
      final data = await _apiService.getOneUser(id: id);
      userData.value = data;
    }catch(ex){
      error.value = "Something went wrong.";
      ex.toString().print;
    }finally{
      isLoading.value = false;
    }
  }
}