import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:user_test/constant/app_routes.dart';
import 'package:user_test/router/app_router.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: AppRouter.pageList,
      initialRoute: AppRoutes.splashScreen,
    );
  }
}