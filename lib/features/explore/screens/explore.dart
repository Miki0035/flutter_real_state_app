import 'package:flutter/material.dart';
import 'package:real_state_app/common/widgets/appbar.dart';
import 'package:real_state_app/common/widgets/icons/appbar_icon_with_notification.dart';
import 'package:real_state_app/common/widgets/search_bar.dart';
import 'package:real_state_app/utilis/constants/images.dart';
import 'package:real_state_app/utilis/constants/sizes.dart';

import '../../../common/widgets/buttons/back_button.dart';

class MExploreScreen extends StatelessWidget {
  const MExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MAppBar(
          leading: MBackButton(),
          title: Text(
            'Search Your Ideal Home',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: MSize.fontSizeLg * 1.1,
            ),
          ),
          actions: [
             MAppBarIconNotification(
              icon: MImage.bell,
            )
          ]),
      body: SingleChildScrollView(
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
