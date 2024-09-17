import 'package:flutter/material.dart';
import 'package:user_test/views/common/common_text.dart';

import '../../constant/constant_export.dart';


PreferredSizeWidget commonAppbar(String title){
  return AppBar(
        title:  CommonText(
          title,
          color: AppColors.white,
        ),
        backgroundColor: AppColors.transparent,
        iconTheme: const IconThemeData(color: AppColors.white),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.white.withOpacity(0.3),
                offset: const Offset(2, 4),
                blurRadius: 2
              )
            ],
            color: AppColors.black
          ),
        ),
      );
}  
    
  
