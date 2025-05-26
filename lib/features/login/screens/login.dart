import 'package:flutter/material.dart';
import 'package:flutter_restate_app/features/login/screens/widgets/text_icon_button.dart';
import 'package:flutter_restate_app/utilis/constants/colors.dart';
import 'package:flutter_restate_app/utilis/constants/images.dart';
import 'package:flutter_restate_app/utilis/constants/sizes.dart';
import 'package:flutter_restate_app/utilis/constants/texts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage(
                    MImage.onboarding,
                  ),
                  width: double.infinity,
                  height: 510,
                ),
                Text(
                  MText.welcome.toUpperCase(),
                  style: const TextStyle(
                    fontSize: MSize.fontSizeLg * 1.1,
                    fontWeight: FontWeight.w500,
                    color: MColor.lightBlack,
                  ),
                ),
                const SizedBox(
                  height: MSize.spaceBtwItems,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: MText.closer,
                        style: TextStyle(
                          color: MColor.black,
                          fontWeight: FontWeight.w600,
                          fontSize: MSize.fontSizeLg * 1.8,
                        ),
                      ),
                      TextSpan(
                        text: MText.idealHome,
                        style: TextStyle(
                            color: MColor.blue,
                            fontWeight: FontWeight.w600,
                            fontSize: MSize.fontSizeLg * 1.8),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: MSize.spaceBtwItems,
                ),
                const Text(
                  MText.login,
                  style: TextStyle(
                      color: MColor.lightBlack,
                      fontWeight: FontWeight.w500,
                      fontSize: MSize.fontSizeLg * 1.1),
                ),
                const SizedBox(
                  height: MSize.spaceBtwItems,
                ),
                const MTextIconButton()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
