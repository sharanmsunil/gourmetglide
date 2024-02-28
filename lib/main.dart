import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gourmetglide/controllers/popular_product_controller.dart';
import 'package:gourmetglide/controllers/recommended_product_controller.dart';
import 'package:gourmetglide/screens/food/fullfooddetails.dart';
import 'package:gourmetglide/screens/home/food_page_body.dart';
import 'package:gourmetglide/screens/home/main_food_page.dart';
import 'helper/dependencies.dart' as dep;


Future <void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      // home: FullFoodDetails(),
      home: MainFoodPage(),
      // home: FoodDetail(),
    );
  }
}