import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:gourmetglide/controllers/popular_product_controller.dart';
import 'package:gourmetglide/controllers/recommended_product_controller.dart';
import 'package:gourmetglide/models/products_model.dart';
import 'package:gourmetglide/utils/app-constants/app_constants.dart';
import 'package:gourmetglide/utils/colors.dart';
import 'package:gourmetglide/utils/dimensions.dart';
import 'package:gourmetglide/widgets/big_text.dart';
import 'package:gourmetglide/widgets/foodnamecolumn.dart';
import 'package:gourmetglide/widgets/icon_and_text_widget.dart';
import 'package:gourmetglide/widgets/small_text.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.pageViewContainer;
  @override
  void initState() {
     pageController.addListener(() {
       setState(() {
         _currPageValue = pageController.page!;
       });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //slider
        GetBuilder<PopularProductController>(
          builder: (PopularProductController popularProducts) {
          return
            popularProducts.isLoaded?Container(
            // color: Colors.red,
            height: Dimensions.pageView,
            child: PageView.builder(
              controller: pageController,
              itemCount: popularProducts.popularProductList.length,
                itemBuilder: (context,index){
              return _buildPageItem(index,popularProducts.popularProductList[index]);
            }),
          ) :
                Column(
                  children: [
                    SizedBox(height: Dimensions.height20,),
                    CircularProgressIndicator(
                      color: AppColors.mainColor,
                    )
                  ],
                );
          },
        ),
        //dots
        GetBuilder<PopularProductController>(
        builder: (PopularProductController popularProducts) {
          return SmoothPageIndicator(
            controller: pageController,
            count: popularProducts.popularProductList.isEmpty? 1 : popularProducts.popularProductList.length,
            effect: WormEffect(
                dotWidth: 8,
                dotHeight: 8,
                activeDotColor: AppColors.mainColor
            ),
          );
        }
        ),
        //popular
        SizedBox(
          height: Dimensions.height30,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            margin: EdgeInsets.only(left: Dimensions.width30,),
            child: BigText(text: "Recommended"),
          ),
        ),
        GetBuilder<RecommendedProductController>(
          builder: (RecommendedProductController recommendedProduct) {
          return
            recommendedProduct.isLoaded? ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: recommendedProduct.recommendedProductList.length,
                itemBuilder: (context,index){
            return Container(
              margin: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20,bottom: Dimensions.height10),
              child: Row(
                children: [
                  Container(
                    width: Dimensions.listViewImgSize,
                    height: Dimensions.listViewImgSize,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: Colors.white38,
                      image: DecorationImage(image: NetworkImage(AppConstants.BASE_URL+AppConstants.UPLOAD_URI+recommendedProduct.recommendedProductList[index].img!),fit: BoxFit.cover)
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: Dimensions.listViewTextContSize,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(Dimensions.radius20),
                          bottomRight: Radius.circular(Dimensions.radius20)
                        ),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: Dimensions.width10,right: Dimensions.width10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BigText(text: recommendedProduct.recommendedProductList[index].name!),
                            SizedBox(height: Dimensions.height10,),
                            SmallText(text: "with cocunut"),
                            SizedBox(height: Dimensions.height10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconAndTextWidget(icon: Icons.circle_sharp, text: "Normal", iconColor: AppColors.iconColor1),
                                IconAndTextWidget(icon: Icons.location_on, text: "1.2km", iconColor: AppColors.mainColor),
                                IconAndTextWidget(icon: Icons.access_time_rounded, text: "28min", iconColor: AppColors.iconColor2),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          }) :
            Column(
              children: [
                SizedBox(height: Dimensions.height20,),
                CircularProgressIndicator(
                  color: AppColors.mainColor,
                )
              ],
            );
          },)
      ],
    );
  }
  Widget _buildPageItem(int index, ProductModel popularProduct){
    Matrix4 matrix = new Matrix4.identity();
    if(index == _currPageValue.floor()){
      var currScale = 1-(_currPageValue-index)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);

    }else if(index == _currPageValue.floor()+1){
      var currScale = _scaleFactor+(_currPageValue-index+1)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);

    } else if(index == _currPageValue.floor()-1){
      var currScale = 1-(_currPageValue-index)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);

    }else{
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, _height*(1-_scaleFactor)/2, 1);
    }
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: Dimensions.pageViewContainer,
            margin: EdgeInsets.only(left: Dimensions.width10,right: Dimensions.width10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius30),
              color: index.isEven?Color(0xff69c5df):Color(0xFF9294cc),
              image: DecorationImage(image: NetworkImage(AppConstants.BASE_URL+AppConstants.UPLOAD_URI+popularProduct.img!),fit: BoxFit.cover)
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(left: Dimensions.width30,right: Dimensions.width30,bottom: Dimensions.height30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
                    blurRadius: 5.0,
                    offset: Offset(0, 5)
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-5, 0)
                  ),
                  BoxShadow(
                      color: Colors.white,
                      offset: Offset(5, 0)
                  ),
                ]
              ),
              child: Container(
                padding: EdgeInsets.only(top: Dimensions.height15,left: Dimensions.width15,right: Dimensions.width15),
                child: FoodNameColumn(text: popularProduct.name!,),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
