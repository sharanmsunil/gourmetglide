import 'package:gourmetglide/controllers/popular_product_controller.dart';
import 'package:gourmetglide/controllers/recommended_product_controller.dart';
import 'package:gourmetglide/data/api/api_client.dart';
import 'package:get/get.dart';
import 'package:gourmetglide/data/repository/popular_product_repo.dart';
import 'package:gourmetglide/data/repository/recommended_product_repo.dart';
import 'package:gourmetglide/utils/app-constants/app_constants.dart';

Future<void> init() async{

  //api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

  //repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));

  //controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(() => RecommendedProductController(recommendedProductRepo: Get.find()));

}