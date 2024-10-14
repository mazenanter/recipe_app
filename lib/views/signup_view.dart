import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/services/firebase_services.dart';
import 'package:recipe_app/utils/app_text_styles.dart';
import 'package:recipe_app/utils/custom_indicator.dart';
import 'package:recipe_app/utils/custom_snack_bar.dart';
import 'package:recipe_app/view_model/sign_up_cubit/sign_up_cubit.dart';
import 'package:recipe_app/views/login_view.dart';
import 'package:recipe_app/widgets/bottom_auth_widget.dart';
import 'package:recipe_app/widgets/custom_auth_button.dart';
import 'package:recipe_app/widgets/custom_text_form_field.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  var userNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    return BlocProvider(
      create: (context) => SignUpCubit(FirebaseServices()),
      child: BlocConsumer<SignUpCubit, SignUpState>(
        listener: (context, state) {
          if (state is SignUpSuccess) {
            customSnackBar(context, 'email created successfully');
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginView(),
              ),
              (route) => false,
            );
          } else if (state is SignUpError) {
            customSnackBar(
              context,
              state.errMsg,
            );
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
                    CustomTextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Must not be empty';
                        }
                        return null;
                      },
                      controller: userNameController,
                    ),
                    SizedBox(
                      height: height * 0.030,
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
                      condition: state is SignUpLoading,
                      builder: (context) => const CustomIndicator(),
                      fallback: (context) => CustomAuthButton(
                        title: 'Sign Up',
                        onPress: () {
                          if (formKey.currentState!.validate()) {
                            BlocProvider.of<SignUpCubit>(context).createUser(
                              email: emailController.text,
                              userName: userNameController.text,
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
                            builder: (context) => const LoginView(),
                          ),
                        );
                      },
                      title: 'Already a member?',
                      buttonTitle: 'Sign In',
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
