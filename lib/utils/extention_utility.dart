import 'dart:developer';

import 'package:user_test/constant/app_strings.dart';

extension Print on String{
  void get print => log(this, name: AppStrings.userData);  
}