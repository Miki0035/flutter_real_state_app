import 'package:flutter/material.dart';
import 'package:flutter_restate_app/common/widgets/container/avatar_circular_image_container.dart';
import 'package:flutter_restate_app/utilis/constants/images.dart';
import 'package:flutter_restate_app/utilis/constants/sizes.dart';

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
                const MAvatarCircular(image: MImage.avatar),
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
                  fontWeight: FontWeight.w600, fontSize: MSize.fontSizeLg),
            )
          ],
        ),
      ],
    );
  }
}
