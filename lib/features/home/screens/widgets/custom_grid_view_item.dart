import 'package:flutter/material.dart';
import 'package:real_state_app/common/widgets/container/stacked_image_with_rating_button.dart';
import 'package:real_state_app/features/detail/screens/detail_screen.dart';
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
  final int price;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MDetailScreen()));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MStackImageWithRatingIconButton(image: image, rating: rating),
            const SizedBox(
              height: 8.0,
            ),
            Expanded(
              child: Text(
                apartmentName,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: MSize.fontSizeMd,
                ),
              ),
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
      ),
    );
  }
}
