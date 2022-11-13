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

// ignore: must_be_immutable
class LoginBodyWidget extends StatelessWidget {
  LoginBodyWidget({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // emailController.text = "yehia@gmail.com";
    // passwordController.text = "000000";

    LoginCubit cubit = BlocProvider.of<LoginCubit>(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double spaceHeight = 0.0;


    return BlocListener<LoginCubit, LoginState>(listener: (context, state) {
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
                  cubit.postLoginData();
                // Navigator.pushNamed(context, Routes.homePageRoute);
                }
              },
            ),
          ],
        ),
      ),
    );}
    ));
  }
}
