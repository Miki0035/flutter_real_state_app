
import 'package:flutter/material.dart';
import 'package:real_state_app/utilis/constants/images.dart';
import 'package:real_state_app/utilis/constants/sizes.dart';

class MAvatarHeading extends StatelessWidget {
  const MAvatarHeading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0)),
                  child: const Image(
                    image: AssetImage(MImage.avatar),
                    fit: BoxFit.fill,
                    width: 120,
                    height: 120,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () {},
                    child: const Image(
                      image: AssetImage(MImage.edit),
                      width: 30,
                      height: 30,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: MSize.spaceBtwItems,
            ),
            const Text(
              'Mikiyas Kebede',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: MSize.fontSizeLg),
            )
          ],
        ),
      ],
    );
  }
}
