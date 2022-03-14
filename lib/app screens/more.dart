import 'package:flutter/material.dart';
import 'package:mtech_attendance/Widgets/text_widget.dart';

import '../utils/config.dart';
import '../utils/dynamic_sizes.dart';
import 'dart:math' as math;

class MoreScreen extends StatefulWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: CustomSizes().dynamicWidth(context, 1),
          height: CustomSizes().dynamicHeight(context, 1),
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                right: 0,
                child: Transform.rotate(
                  angle: math.pi / 1,
                  child: Image.asset(
                    'assets/signup_top.png',
                    color: AppColors.customBlue,
                    width: CustomSizes().dynamicWidth(context, 0.35),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                child: Transform.rotate(
                  angle: math.pi / 1,
                  child: Image.asset(
                    "assets/loginbottom.png",
                    color: AppColors.customBlue,
                    width: CustomSizes().dynamicWidth(context, 0.4),
                  ),
                ),
              ),
              SizedBox(
                width: CustomSizes().dynamicWidth(context, 1),
                height: CustomSizes().dynamicHeight(context, 1),
                child: Column(
                  children: [
                    CustomSizes().heightBox(context, 0.1),

                    CircleAvatar(
                      radius: CustomSizes().dynamicHeight(context, 0.05),
                      backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOOFMe-CzzMAgkPdsGK1wsKLtoF33HXGK98A&usqp=CAU")
                    ),
                    text(context, "Elon Musk", 0.035, AppColors.customBlack,bold:true),
                    text(context, "Developer", 0.03, AppColors.customGrey),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
