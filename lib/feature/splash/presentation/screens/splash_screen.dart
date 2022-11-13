import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../core/utils/assets_manager.dart';
import '../../../home_page/presentation/screens/home_page.dart';
import '../../../login/presentation/cubit/login_cubit.dart';
import '../../../login/presentation/screens/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;
  // LoginDataModel loginDataModel = const LoginDataModel();

  _goNext() =>
      Navigator.push(
         context, MaterialPageRoute(builder: (context) {
            return
              BlocProvider<LoginCubit>(
                create: (context) {
                  LoginCubit cubit = LoginCubit();
                  return cubit;
                },
                child: LoginScreen(),
              );
          })
      );

  _startDelay() {
    _timer = Timer(const Duration(milliseconds: 3000), () => _goNext());
  }

  // _getStoreUser() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   if(prefs.getString('user')!=null){
  //     Map<String, dynamic> userMap = jsonDecode(prefs.getString('user')!);
  //     LoginDataModel loginDataModel = LoginDataModel.fromJson(userMap);
  //     this.loginDataModel = loginDataModel;
  //   }
  // }

  @override
  void initState() {
    super.initState();
    // _getStoreUser();
    _startDelay();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              ImageAssets.superSalesLogo,
            ),
          ),
        ],
      ),
    );
  }
}
