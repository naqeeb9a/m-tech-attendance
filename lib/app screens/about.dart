import 'package:flutter/material.dart';
import 'package:mtech_attendance/Widgets/text_widget.dart';
import 'package:mtech_attendance/app%20screens/login.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/config.dart';
import '../utils/dynamic_sizes.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Image.asset(
                'assets/signup_top.png',
                color: AppColors.customBlue,
                width: CustomSizes().dynamicWidth(context, 0.35),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset(
                "assets/loginbottom.png",
                color: AppColors.customBlue,
                width: CustomSizes().dynamicWidth(context, 0.4),
              ),
            ),
            Center(
              child: SizedBox(
                height: CustomSizes().dynamicHeight(context, 1),
                width: CustomSizes().dynamicWidth(context, 0.9),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    topBar(context, "About"),
                    CustomSizes().heightBox(context, 0.25),
                    Center(
                      child: text(
                        context,
                        "HOW WE STARTED IT",
                        0.05,
                        AppColors.customBlack,
                        bold: true,
                      ),
                    ),
                    CustomSizes().heightBox(context, 0.05),
                    text(
                        context,
                        "We took off from a one-room office 12 years ago and grew rapidly into a massive group of tech geniuses devoted to provide the best of the best to our clients.",
                        0.045,
                        AppColors.customBlack,
                        maxLines: 5),
                    CustomSizes().heightBox(context, 0.12),
                    Center(
                      child: text(
                        context,
                        "CONTACT US",
                        0.05,
                        AppColors.customBlack,
                        bold: true,
                      ),
                    ),
                    CustomSizes().heightBox(context, 0.07),
                    GestureDetector(
                      onTap: () async {
                        if (!await launch("tel:+923236674022")) {
                          throw 'Could not launch +92 323 6674022';
                        }
                      },
                      child: Row(
                        children: [
                          const Icon(Icons.phone_enabled_outlined),
                          CustomSizes().widthBox(context, .03),
                          text(
                            context,
                            "+92 323 6674022",
                            0.04,
                            AppColors.customBlack,
                          ),
                        ],
                      ),
                    ),
                    CustomSizes().heightBox(context, 0.07),
                    GestureDetector(
                      onTap: () async {
                        if (!await launch("tel: +923204176454")) {
                          throw 'Could not launch +92 320 4176454';
                        }
                      },
                      child: Row(
                        children: [
                          const Icon(Icons.phone_enabled_outlined),
                          CustomSizes().widthBox(context, .03),
                          text(
                            context,
                            "+92 320 4176454",
                            0.04,
                            AppColors.customBlack,
                          ),
                        ],
                      ),
                    ),
                    CustomSizes().heightBox(context, 0.07),
                    GestureDetector(
                      onTap: () async {
                        if (!await launch("mailto:info@cmcmtech.com")) {
                          throw 'Could not launch info@cmcmtech.com';
                        }
                      },
                      child: Row(
                        children: [
                          const Icon(Icons.email_outlined),
                          CustomSizes().widthBox(context, .03),
                          text(
                            context,
                            "info@cmcmtech.com",
                            0.04,
                            AppColors.customBlack,
                          ),
                        ],
                      ),
                    ),
                    CustomSizes().heightBox(context, 0.07),
                    GestureDetector(
                      onTap: () async {
                        if (!await launch("http://cmcmtech.com/")) {
                          throw 'Could not launch cmcmtech.com';
                        }
                      },
                      child: Row(
                        children: [
                          const Icon(Icons.work_outline_rounded),
                          CustomSizes().widthBox(context, .03),
                          text(
                            context,
                            "cmcmtech.com",
                            0.04,
                            AppColors.customBlack,
                          ),
                        ],
                      ),
                    ),
                    CustomSizes().heightBox(context, 0.07),
                    GestureDetector(
                      onTap: () async {
                        if (!await launch(
                            "https://www.google.com/maps/place/CMC+M-Tech/@31.524716,74.383661,16z/data=!4m5!3m4!1s0x0:0x5aea979fb54ee09!8m2!3d31.5247155!4d74.383661?hl=en")) {
                          throw 'Could not launch location';
                        }
                      },
                      child: Row(
                        children: [
                          const Icon(Icons.location_on_outlined),
                          CustomSizes().widthBox(context, .03),
                          Flexible(
                            child: text(
                              context,
                              "59/9A Sher Khan Rd, Cantt, Lahore, Punjab",
                              0.04,
                              AppColors.customBlack,
                              maxLines: 2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
