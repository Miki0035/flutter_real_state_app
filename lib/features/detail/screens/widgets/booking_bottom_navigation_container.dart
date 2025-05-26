import 'package:flutter/material.dart';
import 'package:flutter_restate_app/common/widgets/buttons/custom_elevated_button.dart';
import 'package:flutter_restate_app/utilis/constants/colors.dart';
import 'package:flutter_restate_app/utilis/constants/sizes.dart';

class MBookingBottomNavContainer extends StatelessWidget {
  const MBookingBottomNavContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30.0),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(50.0), topRight: Radius.circular(50.0)),
          border: Border.all(color: MColor.lightBlue.withValues(alpha: 0.2))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "price".toUpperCase(),
                  style: const TextStyle(
                      fontSize: MSize.fontSizeSm,
                      color: MColor.veryLightBlack,
                      fontWeight: FontWeight.w500),
                ),
                const Text(
                  "\$17821",
                  style: TextStyle(
                      fontSize: MSize.fontSizeLg * 1.2,
                      color: MColor.blue,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: MElevatedButton(
              onPressed: () {},
              text: "Booking Now",
            ),
          )
        ],
      ),
    );
  }
}
