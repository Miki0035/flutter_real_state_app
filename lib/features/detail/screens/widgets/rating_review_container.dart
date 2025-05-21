import 'package:flutter/material.dart';
import 'package:real_state_app/utilis/constants/images.dart';
import 'package:real_state_app/utilis/constants/sizes.dart';

class MRatingReviewContainer extends StatelessWidget {
  const MRatingReviewContainer({
    super.key,
    required this.rating,
    required this.reviews,
    this.size = 15,
    this.fontSize = MSize.fontSizeMd,
    this.fontWeight = FontWeight.w400,
  });

  final double rating;
  final int reviews;
  final double size;
  final double fontSize;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          MImage.star,
          color: Colors.orangeAccent,
          width: size,
          height: size,
        ),
        const SizedBox(
          width: 4.0,
        ),
        Text.rich(
          style: TextStyle(fontSize: fontSize, fontWeight: fontWeight),
          TextSpan(
            children: [
              TextSpan(text: "$rating"),
              TextSpan(text: " ($reviews reviews) ")
            ],
          ),
        ),
      ],
    );
  }
}
