
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:super_hero/feature/home_page/data/models/saledata_model.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/is_language_methods.dart';
import '../screens/Orders_Deatils.dart';


class ItemsOrders extends StatelessWidget {
  final SaleDataModel? saleDataModel;
   ItemsOrders({super.key,this.saleDataModel});


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const OrdersDetails(),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          padding: const EdgeInsets.all(13),
          height: 90,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: Colors.white),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
               CachedNetworkImage(
                 imageUrl: "https://png.pngtree.com/png-clipart/20200727/original/pngtree-paint-real-state-construction-company-logo-png-image_5369252.jpg",
                width: 64,
                height: 64,
                fit: BoxFit.fill,
                placeholder: (context, url) =>
                    CircularProgressIndicator(
                      color: AppColors.primary2,
                    ),
                errorWidget: (context, url, error) => Icon(
                  Icons.error,
                  size: 64,
                  color: AppColors.primary,
                ),
                imageBuilder: (context, imageProvider) =>
                    CircleAvatar(
                      backgroundColor: AppColors.primary2,
                      backgroundImage: imageProvider,
                    ),
              ),
              const SizedBox(width: 12),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(saleDataModel!.name,
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const   Text(
                    "Location",
                    style:  TextStyle(fontSize: 13),
                  )
                ],
              ),
              const Spacer(),
              Row(
                children: [
                   Text(
                    saleDataModel!.customer,
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0XFF143360),
                    ),
                  ),
                  const SizedBox(width: 3),
                 IsLanguage.isEnLanguage(context)
                      ? const Icon(
                    Icons.keyboard_arrow_right_outlined,
                    size: 12,
                    color: Color(0XFF143360),
                  )
                      : const Icon(
                    Icons.keyboard_arrow_left_outlined,
                    size: 12,
                    color: Color(0XFF143360),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
