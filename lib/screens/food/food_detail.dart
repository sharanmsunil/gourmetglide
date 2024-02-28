import 'package:flutter/material.dart';
import 'package:gourmetglide/utils/colors.dart';
import 'package:gourmetglide/utils/dimensions.dart';
import 'package:gourmetglide/widgets/appicon.dart';
import 'package:gourmetglide/widgets/big_text.dart';
import 'package:gourmetglide/widgets/expandable_text_widget.dart';
import 'package:gourmetglide/widgets/foodnamecolumn.dart';

class FoodDetail extends StatelessWidget {
  const FoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //bg img
          Positioned(
            left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimensions.detailFoodImgSize,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/image/food0.png"),fit: BoxFit.cover)
                ),
              )),
          //food name details
          Positioned(
            top: Dimensions.height45,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(icon: Icons.arrow_back_ios),
                  AppIcon(icon: Icons.shopping_cart_outlined),
                ],
              )),
          //food details
          Positioned(
            left: 0,
              right: 0,
              bottom: 0,
              top: Dimensions.detailFoodImgSize-20,
              child: Container(
                padding: EdgeInsets.only(
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                  top: Dimensions.height20
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20),
                    topRight:Radius.circular(Dimensions.radius20),
                  ),
                  color: Colors.white
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FoodNameColumn(text: 'Kerala Porota',),
                    SizedBox(height: Dimensions.height20,),
                    BigText(text: "Introduce"),
                    Expanded(child: SingleChildScrollView(child: ExpandableTextWidget(text: "Parotta or Porotta is a layered Indian and Sri Lankan flatbread made from Maida or Atta, alternatively known as flaky ribbon pancake. It is very common in the Indian states of Kerala and Tamil Nadu and widely available in other states like Karnataka and Maharashtra and countries like Malaysia, the United Arab Emirates and Sri Lanka.Porottas are often available as street food and in restaurants. In some places it is also served at weddings, religious festivals and feasts. It is prepared by kneading maida/wheat flour, egg (in some recipes), oil or ghee and water. The dough is beaten into thin layers and later forming a round spiralled into a ball using these thin layers. The ball is rolled flat and pan-fried. It is often served with a meat curry, such as chicken, goat, beef, or lamb.it is a famous dish in Kerala")))
                  ],
                )
              ))
        ],
      ),
      bottomNavigationBar: Container(
        height: Dimensions.bottomHeightBar,
        padding: EdgeInsets.only(
          top: Dimensions.height30,
          bottom: Dimensions.height30,
          left: Dimensions.width20,
          right: Dimensions.width20,
        ),
        decoration: BoxDecoration(
          color: AppColors.buttonBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.radius20*2),
            topRight: Radius.circular(Dimensions.radius20*2)
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(
                  top: Dimensions.height20,bottom: Dimensions.height20,
              left: Dimensions.width20,right: Dimensions.width20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white
              ),
              child: Row(
                children: [
                  Icon(Icons.remove,color: AppColors.signColor,),
                  SizedBox(width: Dimensions.width5,),
                  BigText(text: "0"),
                  SizedBox(width: Dimensions.width5,),
                  Icon(Icons.add,color: AppColors.signColor,),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  top: Dimensions.height20,bottom: Dimensions.height20,
                  left: Dimensions.width20,right: Dimensions.width20
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: AppColors.mainColor
              ),
              child: BigText(text: "\$10 | Add to cart",color: Colors.white,),
            )
          ],
        ),
      ),
    );
  }
}
