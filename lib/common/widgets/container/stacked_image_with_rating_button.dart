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
    this.showOverlay = false,
    this.positionedHeight = 30.0,
    this.fontWeight = FontWeight.w600,
    this.fontSize = 12.0,
    this.top = 5,
    this.iconSize = 14.0,
  });

  final String image;
  final double rating;
  final double height;
  final double width;
  final bool showOverlay;
  final double positionedHeight;
  final double fontSize;
  final double top;
  final FontWeight fontWeight;
  final double iconSize;

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
                top: 8,
                height: positionedHeight,
                child: TextButton.icon(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    iconSize: iconSize,
                    iconColor: Colors.orangeAccent,
                    side:
                        const BorderSide(width: 1.0, color: Colors.transparent),
                  ),
                  onPressed: () {},
                  label: Text(
                    "$rating",
                    style: TextStyle(
                        color: MColor.blue,
                        fontSize: fontSize,
                        fontWeight: fontWeight),
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
