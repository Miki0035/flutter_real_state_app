import 'package:flutter/material.dart';
import 'package:flutter_restate_app/common/widgets/app_bars/sliver_appbar.dart';
import 'package:flutter_restate_app/common/widgets/container/stacked_image_with_rating_button.dart';
import 'package:flutter_restate_app/common/widgets/texts/headline_text.dart';
import 'package:flutter_restate_app/common/widgets/icons/appbar_icon.dart';
import 'package:flutter_restate_app/common/widgets/texts/trailing_text.dart';
import 'package:flutter_restate_app/data/repository/database/database_repository.dart';
import 'package:flutter_restate_app/features/detail/model/facility_model.dart';
import 'package:flutter_restate_app/features/detail/screens/widgets/apartment_agent_widget.dart';
import 'package:flutter_restate_app/features/detail/screens/widgets/apartment_description.dart';
import 'package:flutter_restate_app/features/detail/screens/widgets/detail_grid_view_item.dart';
import 'package:flutter_restate_app/features/detail/screens/widgets/detail_heading.dart';
import 'package:flutter_restate_app/features/detail/screens/widgets/rating_review_container.dart';
import 'package:flutter_restate_app/features/detail/screens/widgets/review_heart_days_before_row.dart';
import 'package:flutter_restate_app/utilis/constants/colors.dart';
import 'package:flutter_restate_app/utilis/constants/images.dart';
import 'package:flutter_restate_app/utilis/constants/sizes.dart';
import 'package:provider/provider.dart';

import 'widgets/booking_bottom_navigation_container.dart';

class MDetailScreen extends StatelessWidget {
  MDetailScreen({super.key, required this.id});

  final int id;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer<DatabaseRepository>(
      builder: (_, dbRepo, __) {
        final property = dbRepo.getProperty(id);
        return CustomScrollView(
          slivers: [
            MSliverAppBar(
              height: 350,
              image: Image.asset(
                property.image,
                fit: BoxFit.cover,
              ),
              showBackArrow: true,
              actions: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14.0),
                  child: MAppBarIcon(
                    icon: MImage.heart,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14.0),
                  child: MAppBarIcon(icon: MImage.send),
                )
              ],
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  // APARTMENT IMAGE

                  // APARTEMENT DESCRIPTION SECTION
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Column(
                      children: [
                        MApartmentDescription(
                          name: property.name,
                          type: property.type,
                          rating: property.rating,
                          reviews: property.reviews.length,
                          bedRooms: property.bedRooms,
                          area: property.area,
                          bathRooms: property.bathRooms,
                        ),
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                MApartmentAgentContainer(
                                  agentImage: property.agent!.avatar,
                                  agentName: property.agent!.name,
                                  relation: "Owner",
                                ),
                                const Expanded(
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
                            Text(property.description),

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
                                itemBuilder: (_, index) =>
                                    MDetailVerticalIconText(
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
                                itemCount: property.galleries.length,
                                itemBuilder: (_, index) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: MStackImageWithRatingIconButton(
                                    width: 120,
                                    image: property.galleries[index].image,
                                    showOverlay:
                                        index == property.galleries.length - 1,
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
                                Text(
                                  property.address,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: MColor.veryLightBlack,
                                      fontSize: MSize.fontSizeSm),
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
                            MHeadline(
                              leading: MRatingReviewContainer(
                                rating: property.rating,
                                reviews: property.reviews.length,
                                fontSize: MSize.fontSizeLg * 1.2,
                                fontWeight: FontWeight.w600,
                              ),
                              trailing: const MTrailingText(text: "See All"),
                            ),

                            const SizedBox(
                              height: MSize.defaultSpace,
                            ),

                            //REVIEW SECTION

                            ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: property.reviews.length,
                                itemBuilder: (_, index) => Column(
                                      children: [
                                        MApartmentAgentContainer(
                                          size: 44,
                                          agentName:
                                              property.reviews[index]!.name,
                                          agentImage:
                                              property.reviews[index]!.avatar,
                                          isNetworkImage: true,
                                        ),
                                        Text(property.reviews[index]!.review),
                                        MReviewHeartDaysBeforeRowContainer(
                                          rating:
                                              property.reviews[index]!.rating,
                                          postedDate: "6 days ago",
                                        )
                                      ],
                                    ))
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    ), bottomNavigationBar: SafeArea(
      child: Consumer<DatabaseRepository>(builder: (_, dbRepo, __) {
        final property = dbRepo.getProperty(id);
        return MBookingBottomNavContainer(price: property.price);
      }),
    ));
  }
}
