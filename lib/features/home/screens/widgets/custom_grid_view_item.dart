import 'package:flutter/material.dart';
import 'package:real_state_app/utilis/constants/colors.dart';
import 'package:real_state_app/utilis/constants/images.dart';
import 'package:real_state_app/utilis/constants/sizes.dart';

class MHomeGridItem extends StatelessWidget {
  const MHomeGridItem({
    super.key,
    required this.image,
    required this.rating,
    required this.apartmentName,
    required this.location,
    required this.price,
  });

  final String image;
  final double rating;
  final String apartmentName;
  final String location;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            height: 200,
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
                  Positioned(
                    right: 5,
                    top: 2,
                    child: TextButton.icon(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.white,
                        iconSize: MSize.iconSm,
                        iconColor: Colors.orangeAccent,
                        side: const BorderSide(
                            width: 1.0, color: Colors.transparent),
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
          const SizedBox(
            height: 8.0,
          ),
          Text(
            apartmentName,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: MSize.fontSizeMd,
            ),
          ),
          const SizedBox(
            height: 4.0,
          ),
          Text(
            location,
            style: const TextStyle(
                fontSize: MSize.fontSizeSm, color: MColor.lightBlack),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //PRICE
              Text(
                '\$$price',
                style: const TextStyle(
                  color: MColor.blue,
                  fontWeight: FontWeight.w600,
                ),
              ),
              // HEAR ICON
              IconButton(
                onPressed: () {},
                icon: Image.asset(
                  MImage.heart,
                  color: Colors.black,
                  width: MSize.iconMd,
                  height: MSize.iconMd,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
