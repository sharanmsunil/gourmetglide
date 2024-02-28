import 'package:get/get.dart';
import 'package:gourmetglide/data/api/api_client.dart';
import 'package:gourmetglide/utils/app-constants/app_constants.dart';

class PopularProductRepo extends GetxService{
  final ApiClient apiClient;
  PopularProductRepo({
    required this.apiClient
});

  Future<Response> getPopularProductList() async{
    return await apiClient.getdata(AppConstants.POPULAR_PRODUCT_URI);
    // return await apiClient.getdata("https://mvs.bslmeiyu.com/api/v1/products/popular");
  }
}