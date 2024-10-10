import 'package:flutter/material.dart';
import 'package:recipe_app/utils/app_text_styles.dart';
import 'package:recipe_app/views/home_view.dart';
import 'package:recipe_app/views/signup_view.dart';
import 'package:recipe_app/widgets/bottom_auth_widget.dart';
import 'package:recipe_app/widgets/custom_auth_button.dart';
import 'package:recipe_app/widgets/custom_text_form_field.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

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
            CustomTextFormField(
              controller: emailController,
            ),
            SizedBox(
              height: height * 0.030,
            ),
            Text(
              'Enter Password',
              style: AppTextStyles.syleRegular14.copyWith(
                color: Colors.black,
              ),
            ),
            CustomTextFormField(
              controller: passwordController,
            ),
            SizedBox(
              height: height * 0.062,
            ),
            CustomAuthButton(
              title: 'Sign In',
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
            BottomAuthWidget(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignupView(),
                  ),
                );
              },
              title: 'Don’t have an account?',
              buttonTitle: 'Sign Up',
            ),
          ],
        ),
      )),
    );
  }
}
