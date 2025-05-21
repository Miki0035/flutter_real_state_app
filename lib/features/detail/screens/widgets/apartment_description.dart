import 'package:flutter/material.dart';
import 'package:real_state_app/features/detail/screens/widgets/icon_with_text.dart';
import 'package:real_state_app/features/detail/screens/widgets/rating_review_container.dart';
import 'package:real_state_app/features/detail/screens/widgets/text_with_background_and_radius.dart';
import 'package:real_state_app/utilis/constants/colors.dart';
import 'package:real_state_app/utilis/constants/images.dart';
import 'package:real_state_app/utilis/constants/sizes.dart';

class MApartmentDescription extends StatelessWidget {
  const MApartmentDescription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Modernica Apartement",
          style: TextStyle(
              fontSize: MSize.fontSizeLg * 1.2, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 8.0,
        ),
        const Row(
          children: [
            MTextBackgroundRadius(text: "Apartment"),
            SizedBox(
              width: 14.0,
            ),
            MRatingReviewContainer(
              rating: 4.8,
              reviews: 1275,
            ),
          ],
        ),
        const SizedBox(
          height: 12.0,
        ),
        const Row(
          children: [
            MApartementIconText(
              icon: MImage.bed,
              text: "8 beds",
            ),
            MApartementIconText(
              icon: MImage.bath,
              text: "3 bath",
            ),
            MApartementIconText(
              icon: MImage.area,
              text: "2000 sqft",
            ),
          ],
        ),
        const SizedBox(
          height: MSize.spaceBtwSections,
        ),
        Divider(
          color: MColor.lightBlue.withValues(alpha: 0.1),
          height: 1.0,
        )
      ],
    );
  }
}
