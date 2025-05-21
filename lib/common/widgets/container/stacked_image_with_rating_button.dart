import 'package:flutter/material.dart';
import 'package:real_state_app/utilis/constants/colors.dart';
import 'package:real_state_app/utilis/constants/sizes.dart';

class MStackImageWithRatingIconButton extends StatelessWidget {
  const MStackImageWithRatingIconButton({
    super.key,
    required this.image,
    this.rating = 0.0,
    this.height = 200,
    this.width = double.infinity,
    this.showOverlay = false
  });

  final String image;
  final double rating;
  final double height;
  final double width;
  final bool showOverlay;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
            // RATING
            if (rating != 0.0)
              Positioned(
                right: 5,
                top: 2,
                child: TextButton.icon(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    iconSize: MSize.iconSm,
                    iconColor: Colors.orangeAccent,
                    side:
                        const BorderSide(width: 1.0, color: Colors.transparent),
                  ),
                  onPressed: () {},
                  label: Text(
                    "$rating",
                    style: const TextStyle(
                      color: MColor.blue,
                    ),
                  ),
                  iconAlignment: IconAlignment.start,
                  icon: const Icon(Icons.star),
                ),
              ),
            if (showOverlay)
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  color: MColor.lightBlack.withValues(alpha: 0.5),
                ),
                child: const Center(
                  child: Text(
                    "20+",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: MSize.fontSizeLg),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
