import 'package:flutter/material.dart';
import 'package:real_state_app/common/widgets/appbar.dart';
import 'package:real_state_app/common/widgets/buttons/back_button.dart';
import 'package:real_state_app/common/widgets/icons/appbar_icon.dart';
import 'package:real_state_app/features/detail/model/facility_model.dart';
import 'package:real_state_app/features/detail/screens/widgets/apartment_agent_widget.dart';
import 'package:real_state_app/features/detail/screens/widgets/apartment_description.dart';
import 'package:real_state_app/features/detail/screens/widgets/detail_grid_view_item.dart';
import 'package:real_state_app/features/detail/screens/widgets/detail_heading.dart';
import 'package:real_state_app/utilis/constants/colors.dart';
import 'package:real_state_app/utilis/constants/images.dart';
import 'package:real_state_app/utilis/constants/sizes.dart';

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
                  const MApartementDescription(),
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
                        padding: EdgeInsets.only( top: 24.0),
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

                      MDetailHeading(text: "Gallery"),

                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
