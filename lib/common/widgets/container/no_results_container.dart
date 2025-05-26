import 'package:flutter/material.dart';
import 'package:flutter_restate_app/common/widgets/texts/leading_text.dart';
import 'package:flutter_restate_app/common/widgets/texts/trailing_text.dart';
import 'package:flutter_restate_app/utilis/constants/colors.dart';
import 'package:flutter_restate_app/utilis/constants/images.dart';
import 'package:flutter_restate_app/utilis/constants/sizes.dart';

class MNoResultContainer extends StatelessWidget {
  const MNoResultContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      height: 350,
      child: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(MImage.noResult),
          const MLeadingText(text: "No Results"),
          const MTrailingText(
            text: "We could not find any results",
            color: MColor.veryLightBlack,
            fontSize: MSize.fontSizeSm,
          )
        ],
      )),
    );
  }
}
