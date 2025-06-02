import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_restate_app/common/widgets/app_bars/sliver_appbar.dart';
import 'package:flutter_restate_app/common/widgets/buttons/back_button.dart';
import 'package:flutter_restate_app/common/widgets/container/no_results_container.dart';
import 'package:flutter_restate_app/common/widgets/container/stacked_image_with_rating_button.dart';
import 'package:flutter_restate_app/common/widgets/icons/appbar_icon.dart';
import 'package:flutter_restate_app/common/widgets/icons/appbar_icon_with_notification.dart';
import 'package:flutter_restate_app/common/widgets/search_bar.dart';
import 'package:flutter_restate_app/common/widgets/texts/headline_text.dart';
import 'package:flutter_restate_app/common/widgets/texts/leading_text.dart';
import 'package:flutter_restate_app/common/widgets/texts/trailing_text.dart';
import 'package:flutter_restate_app/features/detail/screens/detail_screen.dart';
import 'package:flutter_restate_app/features/explore/providers/explore_filter_tab_provider.dart';
import 'package:flutter_restate_app/features/explore/providers/explore_search_bar_provider.dart';
import 'package:flutter_restate_app/features/home/screens/widgets/home_menu_item.dart';
import 'package:flutter_restate_app/features/navigation/providers/bottom_navigation_provider.dart';
import 'package:flutter_restate_app/utilis/constants/colors.dart';
import 'package:flutter_restate_app/utilis/constants/images.dart';
import 'package:flutter_restate_app/utilis/constants/sizes.dart';

class MExploreScreen extends StatelessWidget {
  MExploreScreen({super.key});

  final List<String> menus = ["All", "House", "Villa", "Apartments", "Others"];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: MColor.veryLightBlack.withValues(alpha: 0.1),
        body: CustomScrollView(
          slivers: [
            MSliverAppBar(
              leading: MBackButton(onPressed: () {
                Provider.of<NavigationProvider>(context, listen: false)
                    .navigateTo(0);
              }),
              title: const Text(
                'Search Your Ideal Home',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: MSize.fontSizeLg,
                ),
              ),
              centerTitle: true,
              actions: const [
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
                    const MSearchBar<ExploreSearchBarProvider>(),
                    const SizedBox(
                      height: MSize.defaultSpace,
                    ),

                    // FILTER MENUS
                    Consumer<ExploreFilterTabProvider>(
                      builder: (context, provider, child) => SizedBox(
                        height: 40,
                        child: ListView.separated(
                          separatorBuilder: (_, index) => const SizedBox(
                            width: 20,
                          ),
                          scrollDirection: Axis.horizontal,
                          itemCount: menus.length,
                          itemBuilder: (_, index) => GestureDetector(
                            onTap: () => provider.changeIndex(index, context),
                            child: MHomeMenu(
                                menu: provider.menus[index],
                                index: index,
                                selectedIndex: provider.selectedIndex),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: MSize.spaceBtwSections,
                    ),

                    Consumer2<ExploreSearchBarProvider,
                        ExploreFilterTabProvider>(
                      builder: (__, providerA, ___, _) => MHeadline(
                        leading: MLeadingText(
                            text:
                                "Found ${providerA.filteredApartments.length} Results"),
                      ),
                    ),

                    //FILTERED VALUE LISTVIEWS
                    Consumer2<ExploreSearchBarProvider,
                        ExploreFilterTabProvider>(
                      builder: (context, providerA, providerB, _) {
                        // FILTER RESULT
                        providerA.search(providerB.selectedFilter);
                        final apartments = providerA.filteredApartments;
                        if (apartments.isNotEmpty) {
                          return ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            separatorBuilder: (_, index) => const SizedBox(
                              height: 16.0,
                            ),
                            shrinkWrap: true,
                            itemCount: providerA.filteredApartments.length,
                            itemBuilder: (_, index) => GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => MDetailScreen(propertyId: providerA.filteredApartments[index].id,)));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(14.0),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    // //LEFT SECTION
                                    Expanded(
                                      flex: 2,
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child:
                                                MStackImageWithRatingIconButton(
                                                    width: 110,
                                                    height: 110,
                                                    positionedHeight: 30.0,
                                                    fontSize: 12.0,
                                                    rating: 4.8,
                                                    iconSize: 8.0,
                                                    top: 2,
                                                    image: providerA
                                                        .filteredApartments[
                                                            index]
                                                        .image),
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                MLeadingText(
                                                  text: providerA
                                                      .filteredApartments[index]
                                                      .name,
                                                ),
                                                const SizedBox(
                                                  height: 8.0,
                                                ),
                                                MTrailingText(
                                                  text: providerA
                                                      .filteredApartments[index]
                                                      .address,
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
                                        padding: const EdgeInsets.all(14.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            const MAppBarIcon(
                                              icon: MImage.heart,
                                              size: 20,
                                            ),
                                            const SizedBox(
                                              height: MSize.spaceBtwSections,
                                            ),
                                            MTrailingText(
                                              text:
                                                  "\$${providerA.filteredApartments[index].price}",
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
                          );
                        } else {
                          return const MNoResultContainer();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
