import 'package:flutter/material.dart';
import 'package:gourmetglide/screens/home/food_page_body.dart';
import 'package:gourmetglide/utils/colors.dart';
import 'package:gourmetglide/utils/dimensions.dart';
import 'package:gourmetglide/widgets/big_text.dart';
import 'package:gourmetglide/widgets/small_text.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Container(
              margin: EdgeInsets.only(
                  top: Dimensions.height45, bottom: Dimensions.height15),
              padding: EdgeInsets.only(
                  left: Dimensions.width20, right: Dimensions.width20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(
                        text: "Ernakulam",
                        color: AppColors.mainColor,
                      ),
                      Row(
                        children: [
                          SmallText(
                            text: "Kochi",
                            color: Colors.black54,
                          ),
                          Icon(Icons.arrow_drop_down)
                        ],
                      )
                    ],
                  ),
                  Center(
                    child: Container(
                      width: Dimensions.height45,
                      height: Dimensions.height45,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius15),
                          color: AppColors.mainColor),
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                        size: Dimensions.iconSize24,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(child: SingleChildScrollView(child: FoodPageBody()))
        ],
      ),
    );
  }
}
