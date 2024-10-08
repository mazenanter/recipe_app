import 'package:flutter/material.dart';
import 'package:recipe_app/utils/app_text_styles.dart';
import 'package:recipe_app/views/login_view.dart';

class BottomAuthWidget extends StatelessWidget {
  const BottomAuthWidget({
    super.key,
    required this.title,
    required this.buttonTitle,
  });
  final String title;
  final String buttonTitle;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: AppTextStyles.syleMedium11,
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginView(),
                ));
          },
          child: Text(buttonTitle,
              style: AppTextStyles.syleSemiBold11.copyWith(
                color: const Color(0xffFF9C00),
              )),
        ),
      ],
    );
  }
}
