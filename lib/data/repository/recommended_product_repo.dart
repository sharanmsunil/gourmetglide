import 'package:get/get.dart';
import 'package:gourmetglide/data/api/api_client.dart';
import 'package:gourmetglide/utils/app-constants/app_constants.dart';

class RecommendedProductRepo extends GetxService{
  final ApiClient apiClient;
  RecommendedProductRepo({
    required this.apiClient
  });

  Future<Response> getRecommendedProductList() async{
    return await apiClient.getdata(AppConstants.RECOMMENDED_PRODUCT_URI);
  }
}