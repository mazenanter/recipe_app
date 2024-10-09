import 'package:flutter/material.dart';
import 'package:recipe_app/utils/app_colors.dart';

class FabButtom extends StatelessWidget {
  const FabButtom({
    super.key,
    required this.onPress,
  });
  final void Function() onPress;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppColors.baseColor,
      onPressed: onPress,
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }
}
