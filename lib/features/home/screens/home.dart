import 'package:flutter/material.dart';
import 'package:real_state_app/common/widgets/appbar.dart';
import 'package:real_state_app/common/widgets/icons/bell_icon.dart';
import 'package:real_state_app/common/widgets/search_bar.dart';
import 'package:real_state_app/utilis/constants/colors.dart';
import 'package:real_state_app/utilis/constants/images.dart';
import 'package:real_state_app/utilis/constants/sizes.dart';

class MHomeScreen extends StatelessWidget {
  const MHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MAppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                MImage.avatar,
                width: 55,
                height: 55,
                fit: BoxFit.fill,
              ),
              const SizedBox(
                width: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Good Morning",
                      style: TextStyle(
                          color: MColor.veryLightBlack,
                          fontSize: MSize.fontSizeLg,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "Mikiyas Kebede",
                      style: TextStyle(
                          color: MColor.black,
                          fontWeight: FontWeight.w500,
                          fontSize: MSize.fontSizeLg),
                    ),
                  ],
                ),
              )
            ],
          ),
          actions: const [MBellIcon()]),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(MSize.defaultSpace),
          child: Column(
            children: [
              MSearchBar(),
            ],
          ),
        ),
      ),
    );
  }
}
