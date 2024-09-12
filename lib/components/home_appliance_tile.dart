import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_home_ui/models/home_appliance.dart';

class HomeApplianceTile extends StatelessWidget {
  final HomeAppliance homeAppliance;
  final void Function(bool)? onChanged;
  const HomeApplianceTile(
      {super.key, required this.homeAppliance, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onChanged != null) {
          onChanged!(!homeAppliance.isOnOrOff);
        }
        // or onChanged!.call(!isCompleted);
      },
      child: Container(
        margin: const EdgeInsets.only(right: 20, top: 20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: homeAppliance.isOnOrOff ? Colors.black : Colors.grey[300]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              homeAppliance.imageAsset,
              style: TextStyle(
                  fontSize: 35,
                  color: homeAppliance.isOnOrOff
                      ? Colors.grey[300]
                      : Colors.black),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  homeAppliance.name,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: homeAppliance.isOnOrOff
                          ? Colors.grey[300]
                          : Colors.black),
                ),

                // to roate the switch by 90 to appear vertical
                Transform.rotate(
                  angle: pi / 2,
                  child: CupertinoSwitch(
                      value: homeAppliance.isOnOrOff, onChanged: onChanged),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
