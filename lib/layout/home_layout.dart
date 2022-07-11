import 'package:contolpanal_flutter/moduols/Basic_screen.dart';
import 'package:contolpanal_flutter/shear/Cubit/App_cubit.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Home_Layout extends StatelessWidget {
  final Widget screen;
  const Home_Layout({Key? key, required this.screen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: ResponsiveBuilder
    (
        builder: (
        context, sizingInformation)
    {
// Check the sizing information here and return your UI
      if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
        return Basic_Scareen(screen: screen,);
      }

      if (sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
        return Basic_Scareen(screen: screen,);
      }

      if (sizingInformation.deviceScreenType == DeviceScreenType.watch) {
        return Container(color: Colors.yellow);
      }

      return Container(color: Colors.purple);
    },


    ));
  }
}
