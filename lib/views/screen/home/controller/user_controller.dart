import 'package:get/get.dart';
import 'package:user_test/service/api_service.dart';
import 'package:user_test/utils/extention_utility.dart';
import 'package:user_test/views/screen/home/model/user_model.dart';

class UserController extends GetxController {
  RxBool isLoading = false.obs;
  RxString error = "".obs;
  RxList<UserModel> userList = <UserModel>[].obs;
  RxList<UserModel> searchUserList = <UserModel>[].obs;
  RxBool isSearch = false.obs;
  final _apiService = ApiService();

  getAllUsers() async {
    isLoading.value = true;
    error.value = "";
    try {
      final userData = await _apiService.getAllUsers();
      userList.value = userData;
    } catch (ex) {
      error.value = "Something went wrong.";
      ex.toString().print;
    } finally {
      isLoading.value = false;
    }
  }

  void searchUser({required String name}) {
  if (name.isEmpty) return;

  List<UserModel> searchList = [];

  searchList = userList.where((e) {
    return e.name != null && e.name!.toLowerCase().contains(name.toLowerCase());
  }).toList();

  searchUserList.clear();
  searchUserList.addAll(searchList);
}

  @override
  Future<void> onInit() async {
    await getAllUsers();
    super.onInit();
  }
}
