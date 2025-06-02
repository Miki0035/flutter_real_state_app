import 'package:flutter/material.dart';
import 'package:flutter_restate_app/features/detail/screens/detail_screen.dart';
import 'package:flutter_restate_app/utilis/constants/colors.dart';
import 'package:flutter_restate_app/utilis/constants/images.dart';
import 'package:flutter_restate_app/utilis/constants/sizes.dart';

class MCarouselItem extends StatelessWidget {
  const MCarouselItem({
    super.key,
    required this.image,
    required this.id,
    required this.apartmentName,
    required this.location,
    required this.rating,
    required this.price,
  });

  final int id;
  final String image;
  final String apartmentName;
  final String location;
  final double rating;
  final int price;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (_) => MDetailScreen(propertyId: id ))),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: SizedBox(
          width: 260,
          height: 300,
          child: Stack(
            children: [
              // BACKGROUND IMAGE
              Positioned.fill(
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
              // APARTEMENT DISCRIPTION
              Positioned(
                left: 0,
                bottom: 0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        apartmentName,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: MSize.fontSizeLg,
                            fontWeight: FontWeight.w800),
                      ),
                      Text(
                        location,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: MSize.fontSizeSm,
                        ),
                      ),
                      Text(
                        "\$ $price",
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: MSize.fontSizeLg),
                      ),
                    ],
                  ),
                ),
              ),

              // HEART ICON
              Positioned(
                right: 12,
                bottom: 0,
                child: IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    MImage.heart,
                    width: MSize.iconMd,
                    height: MSize.iconMd,
                  ),
                ),
              ),

              // RATING
              Positioned(
                right: 14,
                top: 10,
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
            ],
          ),
        ),
      ),
    );
  }
}
