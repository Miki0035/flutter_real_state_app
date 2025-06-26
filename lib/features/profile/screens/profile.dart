import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_restate_app/common/widgets/app_bars/sliver_appbar.dart';
import 'package:flutter_restate_app/common/widgets/icons/appbar_icon_with_notification.dart';
import 'package:flutter_restate_app/features/profile/models/profile_menu.dart';
import 'package:flutter_restate_app/features/profile/screens/widgets/custom_list_tile.dart';
import 'package:flutter_restate_app/features/profile/screens/widgets/profile_image_with_username.dart';
import 'package:flutter_restate_app/utilis/constants/colors.dart';
import 'package:flutter_restate_app/utilis/constants/images.dart';
import 'package:flutter_restate_app/utilis/constants/sizes.dart';
import 'package:flutter_restate_app/utilis/constants/texts.dart';
import 'package:flutter_restate_app/utilis/popups/full_screen_loader.dart';

import '../../../data/repository/authentication/authentication_repository.dart';

class MProfileScreen extends StatelessWidget {
  MProfileScreen({super.key});

  final List<MProfileMenu> upperListMenus = [
    MProfileMenu(icon: MImage.calendar, title: MText.myBooking),
    MProfileMenu(icon: MImage.wallet, title: MText.payments),
  ];
  final List<MProfileMenu> lowerListMenus = [
    MProfileMenu(icon: MImage.person, title: MText.profile),
    MProfileMenu(icon: MImage.bell, title: MText.notification),
    MProfileMenu(icon: MImage.shield, title: MText.security),
    MProfileMenu(icon: MImage.language, title: MText.language),
    MProfileMenu(icon: MImage.info, title: MText.helpCenter),
    MProfileMenu(icon: MImage.people, title: MText.inviteFriends),
    MProfileMenu(icon: MImage.logout, title: MText.logout),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const MSliverAppBar(
            title: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                MText.profile,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: MSize.fontSizeLg * 1.2),
              ),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: MAppBarIconNotification(
                  icon: MImage.bell,
                ),
              )
            ],
          ),
          SliverPadding(
            padding: const EdgeInsets.all(MSize.defaultSpace),
            sliver: SliverToBoxAdapter(
              child: Column(
                children: [
                  const MAvatarHeading(),
                  const SizedBox(
                    height: MSize.spaceBtwSections,
                  ),

                  Divider(
                    color: MColor.lightBlue.withValues(alpha: 0.1),
                    height: 2.0,
                  ),

                  ...upperListMenus.map((menu) =>
                      MCustomListTile(icon: menu.icon, title: menu.title)),

                  // ListView.builder(
                  //     shrinkWrap: true,
                  //     itemCount: upperListMenus.length,
                  //     itemBuilder: (_, index) {
                  //       return MCustomListTile(
                  //         icon: upperListMenus[index].icon,
                  //         title: upperListMenus[index].title,
                  //       );
                  //     }),

                  Divider(
                    color: MColor.lightBlue.withValues(alpha: 0.1),
                    height: 1.0,
                  ),

                  // LOWER LIST MENUS
                  ...lowerListMenus.indexed.map((menu) => MCustomListTile(
                        icon: menu.$2.icon,
                        title: menu.$2.title,
                        onTap: menu.$1 == lowerListMenus.length - 1
                            ? () async {
                                MScreenNotifier.openLoadingDialog(context);
                                try {
                                  await Provider.of<AuthenticationRepository>(
                                          context,
                                          listen: false)
                                      .logout();
                                  if (context.mounted) {
                                    MScreenNotifier.showSnackBar(context,
                                        "You have successfully logged out",
                                        backgroundColor: Colors.green);
                                    return;
                                  }
                                } catch (e) {
                                  if (context.mounted) {
                                    MScreenNotifier.showSnackBar(context,
                                        "Problem occurred while logging you out, please try again $e",
                                        backgroundColor: Colors.redAccent);
                                  }
                                } finally {
                                  if (context.mounted) {
                                    MScreenNotifier.stopLoadingDialog(context);
                                  }
                                }
                              }
                            : () {},
                        color: menu.$1 == lowerListMenus.length - 1
                            ? Colors.red
                            : MColor.black,
                        showTrailing:
                            menu.$1 == lowerListMenus.length - 1 ? false : true,
                      )),

                  // ListView.builder(
                  //     shrinkWrap: true,
                  //     itemCount: lowerListMenus.length,
                  //     itemBuilder: (_, index) {
                  //       return MCustomListTile(
                  //         icon: lowerListMenus[index].icon,
                  //         title: lowerListMenus[index].title,
                  //         color: index == lowerListMenus.length - 1
                  //             ? Colors.red
                  //             : MColor.black,
                  //         showTrailing:
                  //             index == lowerListMenus.length - 1 ? false : true,
                  //       );
                  //     }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
