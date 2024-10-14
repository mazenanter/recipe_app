import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/services/firebase_services.dart';
import 'package:recipe_app/utils/app_text_styles.dart';
import 'package:recipe_app/utils/custom_indicator.dart';
import 'package:recipe_app/utils/custom_snack_bar.dart';
import 'package:recipe_app/view_model/login_cubit/login_cubit.dart';
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
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;

    return BlocProvider(
      create: (context) => LoginCubit(FirebaseServices()),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            customSnackBar(context, 'login success');
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeView(),
              ),
              (route) => false,
            );
          } else if (state is LoginError) {
            customSnackBar(context, state.errMsg);
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Form(
                key: formKey,
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
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Must not be empty';
                        }
                        return null;
                      },
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
                      secureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Must not be empty';
                        }
                        return null;
                      },
                      controller: passwordController,
                    ),
                    SizedBox(
                      height: height * 0.062,
                    ),
                    ConditionalBuilder(
                      condition: state is LoginLoading,
                      builder: (context) => const CustomIndicator(),
                      fallback: (context) => CustomAuthButton(
                        title: 'Sign In',
                        onPress: () {
                          if (formKey.currentState!.validate()) {
                            BlocProvider.of<LoginCubit>(context).login(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                          }
                        },
                      ),
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
              ),
            )),
          );
        },
      ),
    );
  }
}
