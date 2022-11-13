import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:super_hero/core/widgets/custom_button.dart';
import 'package:super_hero/feature/home_page/presentation/cubit/home_page_cubit.dart';

import '../../../../core/helper/location_helper.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/snackbar_method.dart';
import '../../../../core/widgets/long_text.dart';

class orderDetailsBodyWidget extends StatelessWidget {
   orderDetailsBodyWidget({Key? key}) : super(key: key);
String text= "Here are some tips that you should take into consideration to distinguish from choosing the most suitable type of paint for the walls of the house:\nDetermining the areas and walls to be painted, in order to determine the appropriate quantities of stones for it\nChoosing modern paints Types of well-known brand paints\nDetermining the paint budget, taking care to choose high-quality and high-quality paints, especially in the places where the celebration spends most of their time, such as dining rooms and living rooms\nChoosing colors and types for all rooms of the house after choosing the furniture to match each other\nSee if it can be cleaned with a damp washcloth (cleanable) or washable with soapy water (washable)";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          CachedNetworkImage(
            imageUrl:
                "https://png.pngtree.com/png-clipart/20200727/original/pngtree-paint-real-state-construction-company-logo-png-image_5369252.jpg",
            width: 120,
            height: 120,
            fit: BoxFit.fill,
            placeholder: (context, url) => CircularProgressIndicator(
              color: AppColors.primary,
            ),
            errorWidget: (context, url, error) => Icon(
              Icons.error,
              size: 64,
              color: AppColors.primary,
            ),
            imageBuilder: (context, imageProvider) => CircleAvatar(
              backgroundImage: imageProvider,
              backgroundColor: AppColors.transparent,
            ),
          ),
          const SizedBox(
            height: 13,
          ),
          const Text(
            "Ahmad Yehia",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            height: null,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
            child: Column(
              children:  [
                const SizedBox(
                  height: 10,
                ),
                const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    "Opportunity",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                ),
                LongText(text: text ,)
              ],
            ),
          ),
          const Spacer(),
          BlocBuilder<HomePageCubit, HomePageState>(
            builder: (context, state) {
              return CustomButton(
                text: context.read<HomePageCubit>().text,
                paddingHorizontal: 80,
                color: AppColors.primary,
                onClick: context.read<HomePageCubit>().text == 'Start'
                    ? () {
                        MapsLauncher.launchCoordinates(
                          30.50952,
                          30.9464568,
                          'Google Headquarters are here',
                        ).then((value) {
                          context.read<HomePageCubit>().changeText("End");
                        });
                      }
                    : () {
                        LocationHelper.getCurrantLocation().then((value) {
                          double distance = Geolocator.distanceBetween(
                            value.latitude,
                            value.longitude,
                            30.50952,
                            30.9464568,
                          );
                          if (distance > 2) {
                            snackBar("You Should Complete Order", context,
                                color: AppColors.error);
                          } else {
                            context.read<HomePageCubit>().changeText("Start");
                            snackBar("Order Completed", context,
                                color: AppColors.success);
                          }
                        });
                      },
              );
            },
          )
        ],
      ),
    );
  }
}
