import 'package:flutter/material.dart';
import 'package:recipe_app/utils/app_text_styles.dart';
import 'package:recipe_app/views/home_view.dart';
import 'package:recipe_app/views/signup_view.dart';
import 'package:recipe_app/widgets/custom_auth_button.dart';
import 'package:recipe_app/widgets/custom_text_form_field.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Hello,',
              style: AppTextStyles.syleSemiBold30,
            ),
            const Text(
              'Welcome Back!',
              style: AppTextStyles.syleRegular20,
            ),
            SizedBox(
              height: height * 0.057,
            ),
            Text(
              'Email',
              style: AppTextStyles.syleRegular14.copyWith(
                color: Colors.black,
              ),
            ),
            const CustomTextFormField(),
            SizedBox(
              height: height * 0.030,
            ),
            Text(
              'Enter Password',
              style: AppTextStyles.syleRegular14.copyWith(
                color: Colors.black,
              ),
            ),
            const CustomTextFormField(),
            SizedBox(
              height: height * 0.062,
            ),
            CustomAuthButton(
              onPress: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeView(),
                    ));
              },
            ),
            SizedBox(
              height: height * 0.032,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Don’t have an account?',
                  style: AppTextStyles.syleMedium11,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignupView(),
                        ));
                  },
                  child: Text('Sign up',
                      style: AppTextStyles.syleSemiBold11.copyWith(
                        color: const Color(0xffFF9C00),
                      )),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
