import 'package:flutter/material.dart';
import 'package:flutter_restate_app/features/detail/screens/widgets/icon_with_text.dart';
import 'package:flutter_restate_app/features/detail/screens/widgets/rating_review_container.dart';
import 'package:flutter_restate_app/features/detail/screens/widgets/text_with_background_and_radius.dart';
import 'package:flutter_restate_app/utilis/constants/colors.dart';
import 'package:flutter_restate_app/utilis/constants/images.dart';
import 'package:flutter_restate_app/utilis/constants/sizes.dart';

class MApartmentDescription extends StatelessWidget {
  const MApartmentDescription({
    super.key,
    required this.name,
    required this.type,
    required this.rating,
    required this.reviews,
    required this.bedRooms,
    required this.bathRooms,
    required this.area,
  });

  final String name;
  final String type;
  final double rating;
  final int reviews;
  final int bedRooms;
  final int bathRooms;
  final double area;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: const TextStyle(
              fontSize: MSize.fontSizeLg * 1.2, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 8.0,
        ),
        Row(
          children: [
            MTextBackgroundRadius(text: type),
            const SizedBox(
              width: 14.0,
            ),
            const MRatingReviewContainer(
              rating: 4.8,
              reviews: 1275,
            ),
          ],
        ),
        const SizedBox(
          height: 12.0,
        ),
        Row(
          children: [
            MApartementIconText(
              icon: MImage.bed,
              text: "$bedRooms beds",
            ),
            MApartementIconText(
              icon: MImage.bath,
              text: "$bathRooms bath",
            ),
            MApartementIconText(
              icon: MImage.area,
              text: "$area sqft",
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
