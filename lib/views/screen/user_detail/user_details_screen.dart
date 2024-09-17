import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_test/views/common/common_appbar.dart';
import 'package:user_test/views/common/common_text.dart';
import 'package:user_test/views/screen/user_detail/controller/user_detail_controller.dart';

import '../../../constant/constant_export.dart';

class UserDetailsScreen extends StatelessWidget {
  UserDetailsScreen({super.key});

  final _userDetailController = Get.put(UserDetailController());

  @override
  Widget build(BuildContext context) {
    final id = Get.arguments["id"];
    _userDetailController.getOneUser(id: id);
    return Scaffold(
      appBar: commonAppbar("User Details"),
      backgroundColor: AppColors.black,
      body: Obx(
        () {
          if (_userDetailController.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (_userDetailController.error.isNotEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CommonText(
                    _userDetailController.error.value,
                    color: AppColors.white,
                  ),
                  OutlinedButton(
                    onPressed: () async {
                      await _userDetailController.getOneUser(id: id);
                    },
                    style: const ButtonStyle(
                        foregroundColor:
                            WidgetStatePropertyAll(AppColors.white)),
                    child: const CommonText(
                      AppStrings.tryAgain,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            );
          } else if (_userDetailController.userData.value.name?.isEmpty ??
              true) {
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
                      await _userDetailController.getOneUser(id: id);
                    },
                    style: const ButtonStyle(
                        foregroundColor:
                            WidgetStatePropertyAll(AppColors.white)),
                    child: const CommonText(
                      AppStrings.tryAgain,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            );
          } else {
            final data = _userDetailController.userData.value;
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  _customWidget(title: "Name", name: data.name ?? ""),
                  _customWidget(title: "User Name", name: data.username ?? ""),
                  _customWidget(title: "Email", name: data.email ?? ""),
                  _customWidget(title: "Phone", name: data.phone ?? ""),
                  _customWidget(title: "Website", name: data.website ?? ""),
                  _customWidget(
                      title: "Address",
                      name:
                          "${data.address?.suite ?? ""}, ${data.address?.street ?? ""}, \n${data.address?.city ?? ""}, ${data.address?.zipcode ?? ""}"),
                  _customWidget(
                      title: "Company Name", name: data.company?.name ?? "")
                ],
              ),
            );
          }
        },
      ),
    );
  }

  _customWidget({required String title, required String name}) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [CommonText(title), CommonText(name,textAlign: TextAlign.end,)],
        ),
        const Divider()
      ],
    );
  }
}
