import 'package:flutter/material.dart';
import 'package:real_state_app/common/widgets/appbar.dart';
import 'package:real_state_app/common/widgets/buttons/back_button.dart';
import 'package:real_state_app/common/widgets/container/stacked_image_with_rating_button.dart';
import 'package:real_state_app/common/widgets/texts/headline_text.dart';
import 'package:real_state_app/common/widgets/icons/appbar_icon.dart';
import 'package:real_state_app/common/widgets/texts/trailing_text.dart';
import 'package:real_state_app/features/detail/model/facility_model.dart';
import 'package:real_state_app/features/detail/screens/widgets/apartment_agent_widget.dart';
import 'package:real_state_app/features/detail/screens/widgets/apartment_description.dart';
import 'package:real_state_app/features/detail/screens/widgets/detail_grid_view_item.dart';
import 'package:real_state_app/features/detail/screens/widgets/detail_heading.dart';
import 'package:real_state_app/features/detail/screens/widgets/rating_review_container.dart';
import 'package:real_state_app/features/detail/screens/widgets/review_heart_days_before_row.dart';
import 'package:real_state_app/utilis/constants/colors.dart';
import 'package:real_state_app/utilis/constants/images.dart';
import 'package:real_state_app/utilis/constants/sizes.dart';

import 'widgets/booking_bottom_navigation_container.dart';

class MDetailScreen extends StatelessWidget {
  MDetailScreen({super.key});

  final List<FacilityModel> facilities = [
    const FacilityModel(image: MImage.carPark, text: "Car parking"),
    const FacilityModel(image: MImage.swim, text: "Swimming"),
    const FacilityModel(image: MImage.dumbell, text: "Gym & Fitness"),
    const FacilityModel(image: MImage.wifi, text: "Restaurant"),
    const FacilityModel(image: MImage.wifi, text: "Wifi & Network"),
    const FacilityModel(image: MImage.dog, text: "Pet Center"),
    const FacilityModel(image: MImage.run, text: "Sport Center"),
    const FacilityModel(image: MImage.laundry, text: "Laundry"),
  ];

  final List<String> galleries = [
    MImage.apartmentOne,
    MImage.livingRoomOne,
    MImage.livingRoomTwo,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: MAppBar(
          leading: MBackButton(
            onPressed: () {
              Navigator.pop(context);
            },
            backgroundColor: Colors.white,
          ),
          actions: const [
            MAppBarIcon(
              icon: MImage.heart,
            ),
            SizedBox(
              width: MSize.defaultSpace,
            ),
            MAppBarIcon(icon: MImage.send)
          ]),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // APARTMENT IMAGE
            SizedBox(
              height: 400,
              width: double.infinity,
              child: Image.asset(
                MImage.apartmentOne,
                fit: BoxFit.fill,
              ),
            ),

            // APARTEMENT DESCRIPTION SECTION
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                children: [
                  const MApartmentDescription(),
                  const SizedBox(
                    height: MSize.defaultSpace,
                  ),

                  // AGENT SECTION
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // AGENT DESCRIPTION
                      const MDetailHeading(
                        text: "Agent",
                      ),

                      const SizedBox(
                        height: MSize.spaceBtwItems,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          MApartmentAgentContainer(
                            agentImage: MImage.avatar,
                            agentName: "Natasya Wilodra",
                            relation: "Owner",
                          ),
                          Expanded(
                            flex: 2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                MAppBarIcon(
                                  icon: MImage.chat,
                                  backgroundColor: MColor.lightBlue,
                                ),
                                SizedBox(
                                  width: MSize.defaultSpace,
                                ),
                                MAppBarIcon(
                                  icon: MImage.phone,
                                  backgroundColor: MColor.lightBlue,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: MSize.defaultSpace,
                      ),

                      // OVERVIEW SECTION
                      const MDetailHeading(
                        text: "Overview",
                      ),

                      const SizedBox(
                        height: MSize.spaceBtwItems,
                      ),
                      const Text(
                          "Sleek, modern 2-bedroom apartment with open living space, high-end finishes, and city views. Minutes from downtown, dining, and transit."),

                      const SizedBox(
                        height: MSize.spaceBtwItems,
                      ),

                      // FACILITIES SECTION
                      const MDetailHeading(
                        text: "Facilities",
                      ),

                      // GRID ICONS
                      GridView.builder(
                          padding: const EdgeInsets.only(top: 24.0),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: facilities.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                          ),
                          itemBuilder: (_, index) => MDetailVerticalIconText(
                              icon: facilities[index].image,
                              label: facilities[index].text)),

                      const MDetailHeading(text: "Gallery"),

                      const SizedBox(
                        height: MSize.defaultSpace,
                      ),

                      // GALLERY LIST ITEMS
                      SizedBox(
                        height: 120,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: galleries.length,
                          itemBuilder: (_, index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: MStackImageWithRatingIconButton(
                              width: 120,
                              image: galleries[index],
                              showOverlay: index == galleries.length - 1,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: MSize.spaceBtwItems,
                      ),

                      // LOCATION SECTION
                      const MDetailHeading(text: "Location"),
                      const SizedBox(
                        height: MSize.spaceBtwItems,
                      ),

                      Row(
                        children: [
                          Image.asset(
                            MImage.location,
                            color: MColor.blue,
                            width: 25,
                            height: 25,
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          const Text(
                            "Grand City St.100, New York, United States",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: MColor.veryLightBlack,
                                fontSize: MSize.fontSizeMd),
                          )
                        ],
                      ),

                      // MAP
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            vertical: 24.0, horizontal: 14.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Image.asset(
                          MImage.map,
                          fit: BoxFit.cover,
                        ),
                      ),

                      //RATING + REVIEWS
                      const MHeadline(
                        leading: MRatingReviewContainer(
                          rating: 4.8,
                          reviews: 1275,
                          fontSize: MSize.fontSizeLg * 1.2,
                          fontWeight: FontWeight.w600,
                        ),
                        trailing: MTrailingText(text: "See All"),
                      ),

                      const SizedBox(
                        height: MSize.defaultSpace,
                      ),

                      //REVIEW SECTION

                      const MApartmentAgentContainer(
                          size: 44,
                          agentName: "Charolette Hanlin",
                          agentImage: MImage.avatar),

                      const Text(
                          "The apartment is very clean and modern. I really like the interior design. Looks like I'll feel at home 😍."),
                      const MReviewHeartDaysBeforeRowContainer(
                        rating: 938,
                        postedDate: "6 days ago",
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const SafeArea(
        child: MBookingBottomNavContainer(),
      ),
    );
  }
}
