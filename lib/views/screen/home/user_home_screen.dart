import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';
import 'package:user_test/views/common/common_appbar.dart';
import 'package:user_test/views/common/common_text.dart';
import 'package:user_test/views/common/common_text_field.dart';
import 'package:user_test/views/screen/home/controller/user_controller.dart';
import 'package:user_test/views/screen/home/widget/user_list_widget.dart';

import '../../../constant/constant_export.dart';

class UserHomeScreen extends StatelessWidget {
  UserHomeScreen({super.key});

  final _userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppbar(AppStrings.userData),
      backgroundColor: AppColors.black,
      body: Obx(() {
        if (_userController.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (_userController.error.isNotEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                CommonText(
                  _userController.error.value,
                  color: AppColors.white,
                ),
                OutlinedButton(
                  onPressed: () async {
                    await _userController.getAllUsers();
                  },
                  style: const ButtonStyle(
                      foregroundColor: WidgetStatePropertyAll(AppColors.white)),
                  child: const CommonText(
                    AppStrings.tryAgain,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          );
        } else if (_userController.userList.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const CommonText(
                  AppStrings.userNotFound,
                  color: AppColors.white,
                ),
                OutlinedButton(
                  onPressed: () async {
                    await _userController.getAllUsers();
                  },
                  style: const ButtonStyle(
                      foregroundColor: WidgetStatePropertyAll(AppColors.white)),
                  child: const CommonText(
                    AppStrings.tryAgain,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          );
        } else {
          return Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CommonTextField(
                  hintText: "Search",
                  iconData: Icons.search,
                  onChanged: (value) {
                    _userController.isSearch.value = value.isNotEmpty;
                    _userController.searchUser(name: value);
                  },
                ),
              ),
              Expanded(
                child: _userController.isSearch.value
                    // ignore: invalid_use_of_protected_member
                    ? UserListWidget(userList: _userController.searchUserList.value)
                    : RefreshIndicator(
                        onRefresh: () async {
                          await _userController.getAllUsers();
                        },
                        child:
                            UserListWidget(userList: _userController.userList)),
              ),
            ],
          );
        }
      }),
    );
  }
}
