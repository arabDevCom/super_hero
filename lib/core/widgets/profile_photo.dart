import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

import '../utils/assets_manager.dart';

class ProfilePhotoWidget extends StatefulWidget {
  const ProfilePhotoWidget({Key? key}) : super(key: key);

  @override
  State<ProfilePhotoWidget> createState() => _ProfilePhotoWidgetState();
}

class _ProfilePhotoWidgetState extends State<ProfilePhotoWidget> {
  XFile? image;
  final picker = ImagePicker();

  Future getImage() async {
     image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    // if(image != null){
    //
    //   context.read<RegisterCubit>().image=image;
    //   print("context.read<RegisterCubit>().image!.path");
    //   print(context.read<RegisterCubit>().image!.path);
    //   print(image!.name);
    // }
    return Stack(
      children: [
        SizedBox(
          width: 96,
          height: 96,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: ClipOval(
              // clipper: MyClip(),
              child: (image != null)
                  ? Image.file(
                File(image!.path),
                      width: 140,
                      height: 140,
                      fit: BoxFit.cover,
                    )
                  : Image.asset(ImageAssets.profileImage),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: InkWell(
            onTap: getImage,
            child: SvgPicture.asset(ImageAssets.editPhotoIcon),
          ),
        ),
      ],
    );
  }
}

class MyClip extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return const Rect.fromLTWH(0, 0, 100, 100);
  }

  @override
  bool shouldReclip(oldClipper) {
    return false;
  }
}
