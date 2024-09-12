import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_home_ui/models/home_appliance.dart';

class HomeApplianceTile extends StatefulWidget {
  final HomeAppliance homeAppliance;
  // final void Function(bool)? onChanged;
  const HomeApplianceTile({super.key, required this.homeAppliance});

  @override
  State<HomeApplianceTile> createState() => _HomeApplianceTileState();
}

class _HomeApplianceTileState extends State<HomeApplianceTile> {
  void changeValue(HomeAppliance homeAppliance) {
    setState(() {
      homeAppliance.isOnOrOff = !homeAppliance.isOnOrOff;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20, top: 20),
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color:
              widget.homeAppliance.isOnOrOff ? Colors.black : Colors.grey[300]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.homeAppliance.imageAsset,
            style: TextStyle(
                fontSize: 35,
                color: widget.homeAppliance.isOnOrOff
                    ? Colors.grey[300]
                    : Colors.black),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.homeAppliance.name,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: widget.homeAppliance.isOnOrOff
                        ? Colors.grey[300]
                        : Colors.black),
              ),

              // to roate the switch by 90 to appear vertical
              Transform.rotate(
                angle: pi / 2,
                child: CupertinoSwitch(
                  value: widget.homeAppliance.isOnOrOff,
                  onChanged: (value) {
                    changeValue(widget.homeAppliance);
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
