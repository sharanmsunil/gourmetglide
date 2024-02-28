import 'package:flutter/material.dart';
import 'package:gourmetglide/utils/colors.dart';
import 'package:gourmetglide/utils/dimensions.dart';
import 'package:gourmetglide/widgets/appicon.dart';
import 'package:gourmetglide/widgets/big_text.dart';
import 'package:gourmetglide/widgets/expandable_text_widget.dart';

class FullFoodDetails extends StatelessWidget {
  const FullFoodDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: 300,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.clear),
                AppIcon(icon: Icons.shopping_cart_outlined),
              ],
            ),
            toolbarHeight: Dimensions.height45+35,
            bottom: PreferredSize(preferredSize: Size.fromHeight(20),
                child: Container(
                  child: Center(child: BigText(text: "Kerala Porota",size: Dimensions.font26-2,)),
                  width: double.maxFinite,
                  padding: EdgeInsets.only(top: Dimensions.height10-5,bottom: Dimensions.height10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimensions.radius20),
                      topRight: Radius.circular(Dimensions.radius20),
                    )
                  ),
            )),
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset("assets/image/food0.png",
              width: double.maxFinite,fit: BoxFit.cover,),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20),
                  child: ExpandableTextWidget(text: "Parotta or Porotta is a layered Indian and Sri Lankan flatbread made from Maida or Atta, alternatively known as flaky ribbon pancake. It is very common in the Indian states of Kerala and Tamil Nadu and widely available in other states like Karnataka and Maharashtra and countries like Malaysia, the United Arab Emirates and Sri Lanka.Porottas are often available as street food and in restaurants. In some places it is also served at weddings, religious festivals and feasts. It is prepared by kneading maida/wheat flour, egg (in some recipes), oil or ghee and water. The dough is beaten into thin layers and later forming a round spiralled into a ball using these thin layers. The ball is rolled flat and pan-fried. It is often served with a meat curry, such as chicken, goat, beef, or lamb.it is a famous dish in Kerala Parotta or Porotta is a layered Indian and Sri Lankan flatbread made from Maida or Atta, alternatively known as flaky ribbon pancake. It is very common in the Indian states of Kerala and Tamil Nadu and widely available in other states like Karnataka and Maharashtra and countries like Malaysia, the United Arab Emirates and Sri Lanka.Porottas are often available as street food and in restaurants. In some places it is also served at weddings, religious festivals and feasts. It is prepared by kneading maida/wheat flour, egg (in some recipes), oil or ghee and water. The dough is beaten into thin layers and later forming a round spiralled into a ball using these thin layers. The ball is rolled flat and pan-fried. It is often served with a meat curry, such as chicken, goat, beef, or lamb.it is a famous dish in Kerala"),
                )
              ],
            )
          )
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
              left: Dimensions.width20*2.5,
              right: Dimensions.width20*2.5,
              top: Dimensions.height10,
              bottom: Dimensions.height10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.remove,iconColor: Colors.white,bgColor: AppColors.mainColor,iconSize: Dimensions.iconSize24,),
                 BigText(text: " \$12.88 "+" X "+" 0 ",color: AppColors.mainBlackColor,size: Dimensions.font26,),
                AppIcon(icon: Icons.add,iconColor: Colors.white,bgColor: AppColors.mainColor,iconSize: Dimensions.iconSize24,),
              ],
            ),
          ),
          Container(
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
                  child: Icon(
                    Icons.favorite,color: AppColors.mainColor,
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
        ],
      ),
    );
  }
}
