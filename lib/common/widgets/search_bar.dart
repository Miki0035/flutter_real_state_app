import 'package:flutter/material.dart';
import 'package:real_state_app/utilis/constants/colors.dart';
import 'package:real_state_app/utilis/constants/images.dart';
import 'package:real_state_app/utilis/constants/sizes.dart';

class MSearchBar extends StatelessWidget {
  const MSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        color: MColor.veryLightBlack.withValues(alpha: 0.1),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      icon: Image.asset(
                        MImage.search,
                        width: 25,
                        height: 25,
                      ),
                      labelText: "Search Something",
                      labelStyle: const TextStyle(
                          fontSize: MSize.fontSizeSm, color: MColor.lightBlack),
                    ),
                  ),
                ),
              ],
            ),
            Image.asset(
              MImage.filter,
              width: 25,
              height: 25,
            )
          ],
        ),
      ),
    );
  }
}
