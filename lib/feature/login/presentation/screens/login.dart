import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/utils/translate_text_method.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_textfield.dart';
import '../cubit/login_cubit.dart';
import '../widgets/body_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginCubit cubit = BlocProvider.of<LoginCubit>(context);

    final _formKey = GlobalKey<FormState>();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          translateText(AppStrings.loginText, context),
          style: TextStyle(color: AppColors.black),
        ),
        iconTheme: IconThemeData(
          color: AppColors.black,
        ),
      ),
      body:
      BlocListener<LoginCubit, LoginState>(listener: (context, state) {
        print("Status=>${state}");
        if(state is OnLoginSuccess){
          print("sssss");

          Navigator.pushReplacementNamed(context, Routes.homePageRoute);

        }
      },
          child: LayoutBuilder(
              builder: (context, constraints) {
                return   Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                                child: Image.asset(
                                  ImageAssets.superSalesLogo,
                                  width: double.infinity,
                                  height: 300,
                                )),
                          ],
                        ),
                        CustomTextField(
                          controller: emailController,
                          image: ImageAssets.emailIcon,
                          title: translateText(AppStrings.emailHint, context),
                          validatorMessage:
                          translateText(AppStrings.emailValidatorMessage, context),
                          textInputType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 22),
                        CustomTextField(
                          controller: passwordController,
                          image: ImageAssets.lockIcon,
                          title: translateText(AppStrings.passwordHint, context),
                          validatorMessage: translateText(
                              AppStrings.passwordValidatorMessage, context),
                          isPassword: true,
                          textInputType: TextInputType.visiblePassword,

                        ),
                        const SizedBox(height: 60),
                        CustomButton(
                          text: translateText(AppStrings.loginText, context),
                          color: AppColors.primary,
                          paddingHorizontal: 25,
                          onClick: () {
                            if (_formKey.currentState!.validate()) {
                              cubit.loginModel.params.login=emailController.value.text;
                              cubit.loginModel.params.password=passwordController.value.text;
                              cubit.login(context);
                              // Navigator.pushNamed(context, Routes.homePageRoute);
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                );}
          ))
      // body: BlocConsumer<LoginCubit, LoginState>(
      //   listener: (BuildContext context, state) {},
      //   builder: (BuildContext context, state) {
      //     if (state is LoginLoading) {
      //       return const ShowLoadingIndicator();
      //     } else if (state is LoginLoaded) {
      //       if (state.loginModel.code == 200) {
      //         Future.delayed(
      //           const Duration(milliseconds: 400),
      //           () {
      //             Navigator.pushReplacement(
      //               context,
      //               PageTransition(
      //                 type: PageTransitionType.fade,
      //                 alignment: Alignment.center,
      //                 duration: const Duration(milliseconds: 1300),
      //                 child: NavigatorBar(
      //                   loginDataModel:
      //                       context.read<LoginCubit>().userLoginModel!,
      //                 ),
      //               ),
      //             );
      //             Future.delayed(
      //               const Duration(milliseconds: 700),
      //               () {
      //                 context.read<LoginCubit>().loginSuccessfully();
      //               },
      //             );
      //           },
      //         );
      //         return const ShowLoadingIndicator();
      //       } else if (state.loginModel.code == 411) {
      //         Future.delayed(const Duration(milliseconds: 400), () {
      //           snackBar(
      //             translateText(AppStrings.login411message, context),
      //             context,
      //             color: AppColors.error,
      //           );
      //         });
      //         return LoginBodyWidget();
      //       } else {
      //         Future.delayed(const Duration(milliseconds: 400), () {
      //           snackBar(
      //             translateText(AppStrings.login406message, context),
      //             context,
      //             color: AppColors.error,
      //           );
      //         });
      //
      //         return LoginBodyWidget();
      //       }
      //     } else if (state is LoginLoadedError) {
      //       Future.delayed(const Duration(milliseconds: 400), () {
      //         snackBar(
      //           translateText(AppStrings.serverFail, context),
      //           context,
      //           color: AppColors.error,
      //         );
      //       });
      //       return LoginBodyWidget();
      //     } else {
      //       return LoginBodyWidget();
      //     }
      //   },
      // ),
    );
  }
}
