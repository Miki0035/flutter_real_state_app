import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_restate_app/data/repository/authentication/authentication_repository.dart';
import 'package:provider/provider.dart';
import 'package:flutter_restate_app/common/widgets/app_bars/sliver_appbar.dart';
import 'package:flutter_restate_app/common/widgets/container/no_results_container.dart';
import 'package:flutter_restate_app/common/widgets/texts/headline_text.dart';
import 'package:flutter_restate_app/common/widgets/icons/appbar_icon_with_notification.dart';
import 'package:flutter_restate_app/common/widgets/search_bar.dart';
import 'package:flutter_restate_app/common/widgets/texts/leading_text.dart';
import 'package:flutter_restate_app/common/widgets/texts/trailing_text.dart';
import 'package:flutter_restate_app/features/home/providers/home_filter_tab_provider.dart';
import 'package:flutter_restate_app/features/home/providers/home_search_bar_provider.dart';
import 'package:flutter_restate_app/features/home/screens/widgets/carousel_item_widget.dart';
import 'package:flutter_restate_app/features/home/screens/widgets/custom_grid_view_item.dart';
import 'package:flutter_restate_app/features/home/screens/widgets/home_menu_item.dart';
import 'package:flutter_restate_app/utilis/constants/colors.dart';
import 'package:flutter_restate_app/utilis/constants/images.dart';
import 'package:flutter_restate_app/utilis/constants/sizes.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MHomeScreen extends StatelessWidget {
  const MHomeScreen({super.key});

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
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    MImage.avatar,
                    width: 55,
                    height: 55,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(
                    width: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          "Good Morning",
                          style: TextStyle(
                              color: MColor.veryLightBlack,
                              fontSize: MSize.fontSizeSm,
                              fontWeight: FontWeight.w500),
                        ),
                        Consumer<AuthenticationRepository>(
                            builder: (_, auth, __) {
                          if (auth.status != AuthStatus.authenticated) {
                            return FadeShimmer(
                                width: double.infinity,
                                height: double.infinity);
                          }

                          return Text(
                            auth.user?.userMetadata?['name'] ?? "No email",
                            style: const TextStyle(
                                color: MColor.black,
                                fontWeight: FontWeight.w500,
                                fontSize: MSize.fontSizeMd),
                          );
                        }),
                      ],
                    ),
                  )
                ],
              ),
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
                    //SEARCH BAR
                    const MSearchBar<HomeSearchBarProvider>(),
                    const SizedBox(
                      height: MSize.defaultSpace,
                    ),

                    // HEADLINE TEXT
                    const MHeadline(
                      leading: MLeadingText(text: "Featured"),
                      trailing: MTrailingText(text: "See All"),
                    ),
                    const SizedBox(
                      height: MSize.defaultSpace,
                    ),

                    //CAROUSEL SLIDER
                    Consumer<HomeSearchBarProvider>(
                      builder: (context, provider, child) {
                        if (provider.searchText.isEmpty) {
                          return CarouselSlider.builder(
                            options: CarouselOptions(
                              height: 250,
                              scrollDirection: Axis.horizontal,
                            ),
                            itemCount: provider.properties.length,
                            itemBuilder: (_, int itemIndex, __) =>
                                MCarouselItem(
                                    id: provider.properties[itemIndex].id,
                                    image: provider.properties[itemIndex].image,
                                    apartmentName:
                                        provider.properties[itemIndex].name,
                                    location:
                                        provider.properties[itemIndex].address,
                                    rating:
                                        provider.properties[itemIndex].rating,
                                    price:
                                        provider.properties[itemIndex].price),
                          );
                        } else {
                          return const SizedBox.shrink();
                        }
                      },
                    ),

                    const SizedBox(
                      height: MSize.spaceBtwSections,
                    ),

                    const MHeadline(
                      leading: MLeadingText(text: "Our Recommendation"),
                      trailing: MTrailingText(text: "See All"),
                    ),

                    const SizedBox(
                      height: MSize.defaultSpace,
                    ),

                    // FILTER MENUS
                    SizedBox(
                      height: 40,
                      child: Consumer<HomeFilterTabProvider>(
                        builder: (context, provider, child) =>
                            ListView.separated(
                          separatorBuilder: (_, __) => const SizedBox(
                            width: 20,
                          ),
                          scrollDirection: Axis.horizontal,
                          itemCount: provider.menus.length,
                          itemBuilder: (_, index) => GestureDetector(
                              onTap: () => provider.changeIndex(index),
                              child: MHomeMenu(
                                  menu: provider.menus[index],
                                  index: index,
                                  selectedIndex: provider.selectedIndex)),
                        ),
                      ),
                    ),

                    // GRID VIEW
                    Consumer2<HomeSearchBarProvider, HomeFilterTabProvider>(
                      builder: (__, providerA, providerB, _) {
                        providerA.search(providerB.selectedFilter);

                        final apartments = providerA.filteredProperties;

                        if (apartments.isNotEmpty) {
                          final crossAxisCount =
                              MediaQuery.of(context).size.width ~/ 180;
                          return GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: providerA.filteredProperties.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: crossAxisCount,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 20,
                              childAspectRatio: 3 / 5,
                            ),
                            itemBuilder: (_, index) => MHomeGridItem(
                              id: providerA.filteredProperties[index].id,
                              image: providerA.filteredProperties[index].image,
                              apartmentName:
                                  providerA.filteredProperties[index].name,
                              location:
                                  providerA.filteredProperties[index].address,
                              price: providerA.filteredProperties[index].price,
                              rating:
                                  providerA.filteredProperties[index].rating,
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
