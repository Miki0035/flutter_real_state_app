import 'package:flutter/material.dart';
import 'package:real_state_app/common/widgets/appbar.dart';
import 'package:real_state_app/common/widgets/headline_text.dart';
import 'package:real_state_app/common/widgets/icons/appbar_icon_with_notification.dart';
import 'package:real_state_app/common/widgets/search_bar.dart';
import 'package:real_state_app/features/home/models/apartment_model.dart';
import 'package:real_state_app/features/home/screens/widgets/carousel_item_widget.dart';
import 'package:real_state_app/features/home/screens/widgets/custom_grid_view_item.dart';
import 'package:real_state_app/features/home/screens/widgets/home_menu_item.dart';
import 'package:real_state_app/utilis/constants/colors.dart';
import 'package:real_state_app/utilis/constants/images.dart';
import 'package:real_state_app/utilis/constants/sizes.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MHomeScreen extends StatelessWidget {
  MHomeScreen({super.key});

  final List<ApartmentModel> apartments = [
    ApartmentModel(
        image: MImage.newYork,
        apartmentName: "Merialla Villa",
        location: "New York, US",
        rating: 3.0,
        price: 1222),
    ApartmentModel(
        image: MImage.japan,
        apartmentName: "Modernica Villa",
        location: "New York, US",
        rating: 3.8,
        price: 1500),
    ApartmentModel(
        image: MImage.japan,
        apartmentName: "Modernica Villa",
        location: "New York, US",
        rating: 3.3,
        price: 2000),
    ApartmentModel(
        image: MImage.newYork,
        apartmentName: "Merialla Villa",
        location: "New York, US",
        rating: 2.5,
        price: 2580),
  ];

  final List<String> menus = ["All", "House", "Villa", "Apartments", "Others"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MColor.veryLightBlack.withValues(alpha: 0.1),
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
            MAppBarIconNotification(
              icon: MImage.bell,
            )
          ]),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MSize.defaultSpace),
          child: Column(
            children: [
              //SEARCH BAR
              const MSearchBar(),
              const SizedBox(
                height: MSize.defaultSpace,
              ),

              // HEADLINE TEXT
              const MHeadline(
                leadingText: "Featured",
                trailingText: "See All",
              ),
              const SizedBox(
                height: MSize.defaultSpace,
              ),

              //CAROUSEL SLIDER
              CarouselSlider.builder(
                options: CarouselOptions(
                  autoPlay: true,
                  height: 300,
                  scrollDirection: Axis.horizontal,
                ),
                itemCount: apartments.length,
                itemBuilder: (_, int itemIndex, int pageViewIndex) =>
                    MCarouselItem(
                        image: apartments[itemIndex].image,
                        apartmentName: apartments[itemIndex].apartmentName,
                        location: apartments[itemIndex].location,
                        rating: apartments[itemIndex].rating,
                        price: apartments[itemIndex].price),
              ),

              const SizedBox(
                height: MSize.spaceBtwSections,
              ),

              const MHeadline(
                leadingText: "Our Recommendation",
                trailingText: "See All",
              ),

              const SizedBox(
                height: MSize.defaultSpace,
              ),

              // MENUS
              SizedBox(
                height: 35,
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

              // GRID VIEW
              GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 14,
                      childAspectRatio: 8 / 14,
                      mainAxisSpacing: 12),
                  itemBuilder: (_, index) => const MHomeGridItem(
                        image: MImage.newYork,
                        apartmentName: "La Grand Maison",
                        location: "Tokyo, Japan",
                        price: 12219,
                        rating: 4.8,
                      ))
            ],
          ),
        ),
      ),
    );
  }
}
