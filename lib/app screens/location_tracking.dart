import 'package:flutter/material.dart';
import 'package:mtech_attendance/utils/dynamic_sizes.dart';
import 'dart:math' as math;

import '../utils/config.dart';

class LocationTracking extends StatefulWidget {
  const LocationTracking({Key? key}) : super(key: key);

  @override
  State<LocationTracking> createState() => _LocationTrackingState();
}

class _LocationTrackingState extends State<LocationTracking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: CustomSizes().dynamicWidth(context, 1),
          height: CustomSizes().dynamicHeight(context, 1),
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                child: Transform.rotate(
                  angle: math.pi / 1,
                  child: Image.asset(
                    "assets/loginbottom.png",
                    color: AppColors.customBlue.withOpacity(0.2),
                    width: CustomSizes().dynamicWidth(context, 0.4),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
