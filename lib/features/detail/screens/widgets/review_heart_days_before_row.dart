import 'package:flutter/material.dart';
import 'package:flutter_restate_app/utilis/constants/colors.dart';
import 'package:flutter_restate_app/utilis/constants/images.dart';
import 'package:flutter_restate_app/utilis/constants/sizes.dart';

class MReviewHeartDaysBeforeRowContainer extends StatelessWidget {
  const MReviewHeartDaysBeforeRowContainer({
    super.key,
    required this.rating,
    required this.postedDate,
  });

  final int rating;
  final String postedDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                MImage.heart,
                color: MColor.blue,
                width: 30,
                height: 30,
              ),
              const SizedBox(
                width: 4.0,
              ),
              Text(
                "$rating",
                style: const TextStyle(
                    fontWeight: FontWeight.w600, fontSize: MSize.fontSizeMd),
              ),
            ],
          ),
          Text(
            postedDate,
            style: const TextStyle(color: MColor.veryLightBlack),
          )
        ],
      ),
    );
  }
}
