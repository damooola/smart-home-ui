import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_home_ui/components/home_appliance_tile.dart';
import 'package:smart_home_ui/components/my_icon.dart';
import 'package:smart_home_ui/models/home_appliance.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<HomeAppliance> listOfHomeAppliance = [
    HomeAppliance(imageAsset: "💡", name: "Smart\nLight", isOnOrOff: false),
    HomeAppliance(imageAsset: "📺", name: "Smart\nTv", isOnOrOff: false),
    HomeAppliance(imageAsset: "⏰", name: "Smart\nAlarm", isOnOrOff: false),
    HomeAppliance(imageAsset: "📻", name: "Smart\nRadio", isOnOrOff: false)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 5,
        title: const Text(
          "Smart Home UI",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        centerTitle: true,
        leading: const MyIcon(iconData: Icons.more_horiz),
        actions: const [MyIcon(iconData: Icons.person)],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, top: 40),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Welcome Home,",
                style: TextStyle(fontSize: 15),
              ),
              Text(
                "Hi, Nelson👋",
                style: GoogleFonts.roboto(
                    fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40),
              const Text(
                "Smart Devices",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Expanded(
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1 / 1.2, crossAxisCount: 2),
                  itemCount: listOfHomeAppliance.length,
                  itemBuilder: (context, index) {
                    final HomeAppliance homeAppliance =
                        listOfHomeAppliance[index];
                    return HomeApplianceTile(
                      homeAppliance: homeAppliance,
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
