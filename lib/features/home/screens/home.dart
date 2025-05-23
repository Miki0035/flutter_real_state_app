import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_state_app/common/widgets/app_bars/sliver_appbar.dart';
import 'package:real_state_app/common/widgets/container/no_results_container.dart';
import 'package:real_state_app/common/widgets/texts/headline_text.dart';
import 'package:real_state_app/common/widgets/icons/appbar_icon_with_notification.dart';
import 'package:real_state_app/common/widgets/search_bar.dart';
import 'package:real_state_app/common/widgets/texts/leading_text.dart';
import 'package:real_state_app/common/widgets/texts/trailing_text.dart';
import 'package:real_state_app/features/home/providers/home_filter_tab_provider.dart';
import 'package:real_state_app/features/home/providers/home_search_bar_provider.dart';
import 'package:real_state_app/features/home/screens/widgets/carousel_item_widget.dart';
import 'package:real_state_app/features/home/screens/widgets/custom_grid_view_item.dart';
import 'package:real_state_app/features/home/screens/widgets/home_menu_item.dart';
import 'package:real_state_app/utilis/constants/colors.dart';
import 'package:real_state_app/utilis/constants/images.dart';
import 'package:real_state_app/utilis/constants/sizes.dart';
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
                  const SizedBox(
                    width: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Good Morning",
                          style: TextStyle(
                              color: MColor.veryLightBlack,
                              fontSize: MSize.fontSizeSm,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "Mikiyas Kebede",
                          style: TextStyle(
                              color: MColor.black,
                              fontWeight: FontWeight.w500,
                              fontSize: MSize.fontSizeMd),
                        ),
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
                            itemCount: provider.apartments.length,
                            itemBuilder: (_, int itemIndex, __) =>
                                MCarouselItem(
                                    image: provider.apartments[itemIndex].image,
                                    apartmentName: provider
                                        .apartments[itemIndex].apartmentName,
                                    location:
                                        provider.apartments[itemIndex].location,
                                    rating:
                                        provider.apartments[itemIndex].rating,
                                    price:
                                        provider.apartments[itemIndex].price),
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

                        final apartments = providerA.filteredApartments;

                        if (apartments.isNotEmpty) {
                          return GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: providerA.filteredApartments.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 20,
                              childAspectRatio: 8 / 14.2,
                            ),
                            itemBuilder: (_, index) => MHomeGridItem(
                              image: providerA.filteredApartments[index].image,
                              apartmentName: providerA
                                  .filteredApartments[index].apartmentName,
                              location:
                                  providerA.filteredApartments[index].location,
                              price: providerA.filteredApartments[index].price,
                              rating:
                                  providerA.filteredApartments[index].rating,
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
