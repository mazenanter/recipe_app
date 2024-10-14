import 'package:flutter/material.dart';
import 'package:recipe_app/utils/app_colors.dart';

class CustomAlertDialogButton extends StatelessWidget {
  const CustomAlertDialogButton({
    super.key,
    required this.ingredientController,
    required this.onPressed,
  });
  final TextEditingController ingredientController;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.add,
        color: AppColors.baseColor,
        size: 32,
      ),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Add Ingredient'),
              content: TextField(
                controller: ingredientController,
                decoration: const InputDecoration(hintText: 'Enter ingredient'),
              ),
              actions: [
                TextButton(
                  onPressed: onPressed,
                  child: const Text('Add'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
