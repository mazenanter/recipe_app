import 'package:flutter/material.dart';
import 'package:recipe_app/utils/app_text_styles.dart';
import 'package:recipe_app/views/home_view.dart';
import 'package:recipe_app/widgets/bottom_auth_widget.dart';
import 'package:recipe_app/widgets/custom_auth_button.dart';
import 'package:recipe_app/widgets/custom_text_form_field.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

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
              'Create an account',
              style: AppTextStyles.syleSemiBold20,
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              'Let’s help you set up your account, it won’t take long.',
              style: AppTextStyles.syleRegular11,
            ),
            SizedBox(
              height: height * 0.057,
            ),
            Text(
              'Name',
              style: AppTextStyles.syleRegular14.copyWith(
                color: Colors.black,
              ),
            ),
            const CustomTextFormField(),
            SizedBox(
              height: height * 0.030,
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
              title: 'Sign Up',
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
            const BottomAuthWidget(
              title: 'Already a member?',
              buttonTitle: 'Sign In',
            ),
          ],
        ),
      )),
    );
  }
}
