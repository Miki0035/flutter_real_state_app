import 'package:flutter/material.dart';
import 'package:real_state_app/common/widgets/app_bars/sliver_appbar.dart';
import 'package:real_state_app/common/widgets/container/stacked_image_with_rating_button.dart';
import 'package:real_state_app/common/widgets/icons/appbar_icon.dart';
import 'package:real_state_app/common/widgets/icons/appbar_icon_with_notification.dart';
import 'package:real_state_app/common/widgets/search_bar.dart';
import 'package:real_state_app/common/widgets/texts/headline_text.dart';
import 'package:real_state_app/common/widgets/texts/leading_text.dart';
import 'package:real_state_app/common/widgets/texts/trailing_text.dart';
import 'package:real_state_app/features/home/screens/widgets/home_menu_item.dart';
import 'package:real_state_app/utilis/constants/colors.dart';
import 'package:real_state_app/utilis/constants/images.dart';
import 'package:real_state_app/utilis/constants/sizes.dart';


class MExploreScreen extends StatelessWidget {
  MExploreScreen({super.key});

  final List<String> menus = ["All", "House", "Villa", "Apartments", "Others"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MColor.veryLightBlack.withValues(alpha: 0.1),
      // appBar: MAppBar(
      //     leading: MBackButton(),
      //     title: Text(
      //       'Search Your Ideal Home',
      //       textAlign: TextAlign.center,
      //       style: TextStyle(
      //         fontWeight: FontWeight.w600,
      //         fontSize: MSize.fontSizeLg,
      //       ),
      //     ),
      //     actions: [
      //       MAppBarIconNotification(
      //         icon: MImage.bell,
      //       )
      //     ]),
      body: CustomScrollView(
        slivers: [
          const MSliverAppBar(
            showBackArrow: true,
            title: Text(
              'Search Your Ideal Home',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: MSize.fontSizeLg,
              ),
            ),
            centerTitle: true,
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
                  const MSearchBar(),
                  const SizedBox(
                    height: MSize.defaultSpace,
                  ),

                  // FILTER MENUS
                  SizedBox(
                    height: 40,
                    child: ListView.separated(
                      separatorBuilder: (_, index) => const SizedBox(
                        width: 20,
                      ),
                      scrollDirection: Axis.horizontal,
                      itemCount: menus.length,
                      itemBuilder: (_, index) =>
                          MHomeMenu(menu: menus[index], index: index),
                    ),
                  ),

                  const SizedBox(
                    height: MSize.spaceBtwSections,
                  ),

                  const MHeadline(
                    leading: MLeadingText(text: "Found 182 Apartments"),
                  ),

                  //FILTERED VALUE LISTVIEWS
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (_, index) => const SizedBox(
                      height: 16.0,
                    ),
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (_, index) => Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // //LEFT SECTION
                          Expanded(
                            flex: 2,
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: MStackImageWithRatingIconButton(
                                      width: 110,
                                      height: 110,
                                      positionedHeight: 30.0,
                                      fontSize: 12.0,
                                      rating: 4.8,
                                      iconSize: 8.0,
                                      top: 2,
                                      image: MImage.livingRoomOne),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      MLeadingText(
                                        text: "Lucky Lake Apartments",
                                      ),
                                      SizedBox(
                                        height: 8.0,
                                      ),
                                      MTrailingText(
                                        text: "Beijing, China",
                                        fontSize: MSize.fontSizeSm,
                                        color: MColor.veryLightBlack,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),

                          // // RIGHT SECTION
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(14.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  MAppBarIcon(
                                    icon: MImage.heart,
                                    size: 20,
                                  ),
                                  SizedBox(
                                    height: MSize.spaceBtwSections,
                                  ),
                                  MTrailingText(
                                    text: "\$1234",
                                    fontSize: MSize.fontSizeLg,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
