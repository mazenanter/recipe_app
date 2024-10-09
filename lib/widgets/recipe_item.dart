import 'package:flutter/material.dart';
import 'package:recipe_app/utils/app_text_styles.dart';

class RecipeItem extends StatelessWidget {
  const RecipeItem({super.key, required this.onPress});
  final Function() onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.asset(
                  fit: BoxFit.fill,
                  'assets/mae-mu-H5Hj8QV2Tx4-unsplash 1.png',
                ),
              ),
            ),
            Opacity(
              opacity: 0.8,
              child: Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.black,
                        Colors.black,
                        Colors.black,
                        Colors.black54,
                        Colors.black87,
                      ]),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        maxLines: 2,
                        'Traditional spare ribs baked',
                        style: AppTextStyles.syleSemiBold11.copyWith(
                          fontSize: 12,
                          color: Colors.white,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const Spacer(),
                      const Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Text(
                          maxLines: 2,
                          'By Chef John',
                          style: AppTextStyles.syleRegular8,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
