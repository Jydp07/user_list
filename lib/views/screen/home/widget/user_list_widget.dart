import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_test/views/common/common_text.dart';
import 'package:user_test/views/screen/home/model/user_model.dart';

import '../../../../constant/constant_export.dart';

class UserListWidget extends StatelessWidget {
  const UserListWidget({super.key, required this.userList});
  final List<UserModel> userList;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: userList.length,
        itemBuilder: (context, index) {
          final data = userList[index];
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
            decoration: BoxDecoration(
                color: AppColors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.white)),
            child: ListTile(
              onTap: () {
                Get.toNamed(AppRoutes.userDetailsScreen,
                    arguments: {"id": data.id.toString()});
              },
              title: CommonText(
                data.name ?? "",
                color: AppColors.white,
              ),
              subtitle: CommonText(
                data.email ?? "",
                color: AppColors.white,
              ),
            ),
          );
        });
  }
}
