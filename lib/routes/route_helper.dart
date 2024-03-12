import 'package:get/get.dart';
import 'package:gourmetglide/screens/food/popular_food_detail.dart';
import 'package:gourmetglide/screens/food/recommended_food_details.dart';
import 'package:gourmetglide/screens/home/main_food_page.dart';
class RouteHelper{
  static const String initial = "/";
  static const String homePage = "/home-page";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";

  static String getInitial()=> '$initial';
  static String getHomePage()=> '$homePage';
  static String getPopularFood(int pageId)=> '$popularFood?pageId=$pageId';
  static String getRecommendedFood(int pageId)=> '$recommendedFood?pageId=$pageId';

  static List<GetPage> routes=[
    GetPage(name: initial, page: ()=>MainFoodPage(),),
    GetPage(name: homePage, page: ()=>MainFoodPage(),
    transition: Transition.fade),
    GetPage(name: popularFood, page: (){
      var pageId = Get.parameters['pageId'];
      return PopularFoodDetail( pageId: int.parse(pageId!),);
    },
    transition: Transition.fade
    ),
    GetPage(name: recommendedFood, page: (){
      var pageId = Get.parameters['pageId'];
      return RecommendedFoodDetail(pageId: int.parse(pageId!),);
    },
    transition: Transition.fade
    ),
  ];
}