import 'package:flutter/material.dart';
import 'package:real_state_app/features/detail/screens/widgets/icon_with_text.dart';
import 'package:real_state_app/features/detail/screens/widgets/text_with_background_and_radius.dart';
import 'package:real_state_app/utilis/constants/colors.dart';
import 'package:real_state_app/utilis/constants/images.dart';
import 'package:real_state_app/utilis/constants/sizes.dart';

class MApartementDescription extends StatelessWidget {
  const MApartementDescription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
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
          Row(
            children: [
              const MTextBackgroundRadius(text: "Apartment"),
              const SizedBox(
                width: 14.0,
              ),
              Image.asset(
                MImage.star,
                color: Colors.orangeAccent,
                width: 15,
                height: 15,
              ),
              const SizedBox(
                width: 4.0,
              ),
              const Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: "4.8"),
                    TextSpan(text: " (1,275 reviews) ")
                  ],
                ),
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
      ),
    );
  }
}
