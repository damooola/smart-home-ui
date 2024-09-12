import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_home_ui/components/home_appliance_tile.dart';
import 'package:smart_home_ui/components/my_icon.dart';
import 'package:smart_home_ui/models/home_appliance.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<HomeAppliance> listOfHomeAppliance = [
    HomeAppliance(imageAsset: "💡", name: "Smart\nLight", isOnOrOff: false),
    HomeAppliance(imageAsset: "📺", name: "Smart\nTv", isOnOrOff: false),
    HomeAppliance(imageAsset: "⏰", name: "Smart\nAlarm", isOnOrOff: false),
    HomeAppliance(imageAsset: "📻", name: "Smart\nRadio", isOnOrOff: false)
  ];
  void toggleOnAndOff(int index, bool value) {
    if (isKillSwitchOn == false) {
      setState(() {
        listOfHomeAppliance[index].isOnOrOff = value;
      });
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: const Text(
            "Turn Off AZ-5.",
            style: TextStyle(fontSize: 20),
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  "OK",
                  style: TextStyle(fontSize: 15),
                ))
          ],
        ),
      );
    }
  }

  bool isKillSwitchOn = false;
// kill switch functionality to shut off all appliances at once
  void toggleKillSwitch(bool value) {
    setState(() {
      isKillSwitchOn = !isKillSwitchOn;
      for (var homeAppliance in listOfHomeAppliance) {
        homeAppliance.isOnOrOff = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 5,
        title: const Text(
          "Smart Home",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        centerTitle: true,
        leading: const MyIcon(iconData: Icons.more_horiz),
        actions: const [MyIcon(iconData: Icons.person)],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20.0, top: 20),
              child: Text(
                "Welcome Home,",
                style: TextStyle(fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                "Hi, Nelson👋",
                style: GoogleFonts.roboto(
                    fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Smart Devices",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CupertinoSwitch(
                        activeColor: Colors.red,
                        value: isKillSwitchOn,
                        onChanged: (value) => toggleKillSwitch(value),
                      ),
                      const Text(
                        "AZ-5",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
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
                    onChanged: (value) => toggleOnAndOff(index, value),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
