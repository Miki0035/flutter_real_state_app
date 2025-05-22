import 'package:flutter/material.dart';
import 'package:real_state_app/features/navigation/screens/bottom_navigation.dart';
import 'package:real_state_app/utilis/constants/colors.dart';
import 'package:real_state_app/utilis/constants/images.dart';
import 'package:real_state_app/utilis/constants/sizes.dart';
import 'package:real_state_app/utilis/constants/texts.dart';

class MTextIconButton extends StatelessWidget {
  const MTextIconButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 420,
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
      ),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Color(0x338a8d90), // Adjust opacity and darkness as needed
            blurRadius: 10,
            spreadRadius: 2,
            offset: Offset(0, 4), // Adjust for realistic depth
          )
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: TextButton.icon(
        onPressed: () {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (_) => MBottomNavigation()),
              (Route<dynamic> route) => false);
        },
        label: const Text(
          MText.signUpGoogle,
          style: TextStyle(
              color: MColor.black,
              fontWeight: FontWeight.w600,
              fontSize: MSize.fontSizeLg),
        ),
        icon: const Image(
          image: AssetImage(MImage.google),
          width: 30,
          height: 30,
        ),
      ),
    );
  }
}
