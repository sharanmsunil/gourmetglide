import 'package:flutter/material.dart';
import 'package:gourmetglide/utils/colors.dart';
import 'package:gourmetglide/utils/dimensions.dart';
import 'package:gourmetglide/widgets/big_text.dart';
import 'package:gourmetglide/widgets/icon_and_text_widget.dart';
import 'package:gourmetglide/widgets/small_text.dart';

class FoodNameColumn extends StatelessWidget {
  final String text;
  const FoodNameColumn({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text: text,size: Dimensions.font26,),
        SizedBox(height: Dimensions.height10,),
        Row(
          children: [
            Wrap(
              children: List.generate(5, (index)  {
                return Icon(
                  Icons.star,
                  color: AppColors.mainColor,
                  size: Dimensions.iconSize15,
                );
              }),
            ),
            SizedBox(width: Dimensions.width10,),
            SmallText(text: "4.8"),
            SizedBox(width: Dimensions.width10,),
            SmallText(text: "2087"),
            SizedBox(width: Dimensions.width10,),
            SmallText(text: "comments")
          ],
        ),
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
    );
  }
}
